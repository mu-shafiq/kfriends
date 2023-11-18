import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

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
  int? _remoteUid;
  bool _isJoined = false;
  late RtcEngine agoraEngine;

  late StreamSubscription<dynamic> _proximitySubscription;
  bool _isNear = false;

  @override
  void initState() {
    super.initState();
    // Set up an instance of Agora engine
    setupVoiceSDKEngine().then((value) => join());
    _initProximitySensor();
  }

  Future<void> setupVoiceSDKEngine() async {
    // retrieve or request microphone permission
    await [Permission.microphone].request();

    //create an instance of the Agora engine
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
          Get.back();
          // callController.endsACall(
          //     widget.callId, _remoteUid != null ? "incoming" : "missed");
          // setState(() {
          //   _remoteUid = null;
          // });
        },
      ),
    );
  }

  void _initProximitySensor() {
    _proximitySubscription = ProximitySensor.events.listen((int event) {
      print("Proximity sensor event: $event");
      if (_isJoined && _remoteUid != null) {
        _isNear = (event > 0) ? true : false;

        // Use KeepScreenOn to control the screen state
        if (_isNear) {
          KeepScreenOn.turnOff(); // This will turn off the screen
        } else {
          KeepScreenOn.turnOn(); // This will turn the screen back on
        }
        log('Proximity sensor event: $_isNear');
        setState(() {});
      }
    });
  }

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

  @override
  void dispose() {
    agoraEngine.leaveChannel();
    agoraEngine.release();
    _proximitySubscription.cancel();
    super.dispose();
  }

  bool mute = false;
  bool record = true;
  bool speaker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const SizedBox(),
          title: Text(
            'CALL',
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
                        )
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
                              'Speaker',
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
                              'Mute',
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
                              'Record',
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
                        Get.back();
                        // callController.endsACall(widget.callId,
                        //     _remoteUid != null ? "incoming" : "missed");
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
      statusText = 'Connecting...';
    } else if (_remoteUid == null) {
      statusText = 'Waiting for a user to join...';
    } else {
      statusText = 'Connected to user';
    }

    return statusText;
  }
}
