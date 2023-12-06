import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class VoiceCallScreen extends StatefulWidget {
  final String channelName;
  final String token;
  final int uid;
  final String callId;
  final String receiverName;
  final String receiverImage;
  const VoiceCallScreen(
      {super.key,
      required this.channelName,
      required this.token,
      required this.uid,
      required this.callId,
      required this.receiverName,
      required this.receiverImage});

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  final callController = Get.find<CallsController>();
  final mongodbController = Get.find<MongoDBController>();
  int? _remoteUid;
  bool _isJoined = false;
  late RtcEngine agoraEngine;

  Socket? socket;
  String room = "exampleRoom";
  String user = "exampleUser";

  final bool _isNear = false;

  @override
  void initState() {
    super.initState();
    setupVoiceSDKEngine();
    checkIfUserDeclineTheCall().then((value) => join());
  }



  Future<void> setupVoiceSDKEngine() async {
    await [Permission.microphone].request();

    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: agoraAppID));

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            _isJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          callSessionEnded();

          // callController.endsACall(
          //     widget.callId, _remoteUid != null ? "incoming" : "missed");
          // setState(() {
          //   _remoteUid = null;
          // });
        },
      ),
    );
  }

  // void _initProximitySensor() {
  //   _proximitySubscription = ProximitySensor.events.listen((int event) {
  //     print("Proximity sensor event: $event");
  //     if (_isJoined && _remoteUid != null) {
  //       _isNear = (event > 0) ? true : false;

  //       // Use KeepScreenOn to control the screen state
  //       if (_isNear) {
  //         KeepScreenOn.turnOff(); // This will turn off the screen
  //       } else {
  //         KeepScreenOn.turnOn(); // This will turn the screen back on
  //       }
  //       log('Proximity sensor event: $_isNear');
  //       setState(() {});
  //     }
  //   });
  // }

  void join() async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: widget.token,
      channelId: widget.channelName,
      options: options,
      uid: widget.uid,
    );
  }

  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    agoraEngine.leaveChannel();
  }

  Future<void> checkIfUserDeclineTheCall() async {
    await Future.delayed((const Duration(seconds: 10)));
    String callStatus = await mongodbController
        .getDocument("calls", widget.callId)
        .then(
            (Map<String, dynamic>? value) => value!["data"]['call']['status']);
    if (callStatus == "ended") {
      callSessionEnded();
    }
  }

  @override
  void dispose() {
    agoraEngine.leaveChannel();
    agoraEngine.release();
    FlutterCallkitIncoming.endAllCalls();
    callController.endsACall(
        widget.callId, _remoteUid != null ? "incoming" : "missed");
    callSessionEnded();

    // _proximitySubscription.cancel();
    super.dispose();
  }

  bool mute = false;
  bool record = true;
  bool speaker = false;

  @override
  Widget build(BuildContext context) {
    print('on page 2?');
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const SizedBox(),
          title: Text(
            'CALL'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textBlackColor,
              fontSize: 14.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  Image.asset(
                    Assets.appLogo2,
                    scale: 15.sp,
                  ),
                  2.horizontalSpace,
                  Text(
                    'K-FRIENDS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textGreyColor,
                      fontSize: 7.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffFFFFFF),
                      Color(0xffE2F8FF),
                      Color(0xffAFCFFF)
                    ])),
                width: 1.sw,
                height: .5.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 65.r,
                          child: Image.asset(
                            Assets.user1,
                            scale: .5,
                          ),
                        ),
                        Text(
                          widget.receiverName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 24.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        50.verticalSpace,
                        Image.asset(
                          Assets.incomingblack,
                          color: textBlackColor,
                          scale: 1,
                        ),
                        30.verticalSpace,
                        Text(
                          _status(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textGreyColor,
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: .37.sh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: .8.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                speaker = !speaker;
                                if (speaker) {
                                  await agoraEngine.setEnableSpeakerphone(true);
                                } else {
                                  await agoraEngine
                                      .setEnableSpeakerphone(false);
                                }
                                setState(() {});
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: speaker ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: buttonBlackShadow2,
                                      blurRadius: 8,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Image.asset(
                                  Assets.speaker,
                                  color: speaker ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Speaker'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                mute = !mute;
                                if (mute) {
                                  await agoraEngine.muteLocalAudioStream(true);
                                } else {
                                  await agoraEngine.muteLocalAudioStream(false);
                                }
                                setState(() {});
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: mute ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: buttonBlackShadow2,
                                      blurRadius: 8,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Image.asset(
                                  Assets.mic,
                                  color: mute ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Mute'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  record = !record;
                                });
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: record ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: buttonBlackShadow2,
                                      blurRadius: 8,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Image.asset(
                                  Assets.record,
                                  color: record ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Record'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  InkWell(
                      onTap: () {
                        callSessionEnded();

                        callController.endsACall(widget.callId,
                            _remoteUid != null ? "incoming" : "missed");
                      },
                      child: Image.asset(Assets.reject))
                ],
              ),
            )
          ],
        ));
  }

  String _status() {
    String statusText;

    if (!_isJoined) {
      statusText = 'Connecting...'.tr;
    } else if (_remoteUid == null) {
      statusText = 'Waiting for a user to join...'.tr;
    } else {
      statusText = 'Connected to user'.tr;
    }

    return statusText;
  }

  callSessionEnded() {
    if (Get.previousRoute.compareTo('/VoiceCallScreen') == 0 ||
        Get.previousRoute.compareTo('/') == 0) {
      1.5.seconds.delay().then((value) {
        Get.offAllNamed(Routes.bottomNavBar);
      });
    } else {
      Get.back();
    }
  }
}
