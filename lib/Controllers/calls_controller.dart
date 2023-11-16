import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:permission_handler/permission_handler.dart';

class CallsController extends GetxController {
  final mongodbController = Get.find<MongoDBController>();
  RtcEngine? _engine;

  @override
  Future<void> onInit() async {
    super.onInit();
    _engine = createAgoraRtcEngine();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine!.initialize(const RtcEngineContext(
      appId: agoraAppID,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine!.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          // setState(() {
          //   _localUserJoined = true;
          // });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          // setState(() {
          //   _remoteUid = remoteUid;
          // });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          // setState(() {
          //   _remoteUid = null;
          // });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine!.enableVideo();
    await _engine!.startPreview();

    await _engine!.joinChannel(
      token: "token",
      channelId: "channel",
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> makeACall(String receiverUserId) async {
    try {
      EasyLoading.show();
      log("receiverUserId: $receiverUserId");
      Map<String, dynamic>? res = await mongodbController.callFunction(
        Keys.makeCall,
        data: {
          'receiverUserId': receiverUserId,
        },
      );
      EasyLoading.dismiss();
      if (res![Keys.status] == Keys.success) {
        log(res[Keys.data].toString());
        int agoraUid = res[Keys.data][Keys.uid];
        String token = res[Keys.data][Keys.token];
        String channelName = res[Keys.data][Keys.channelName];

        Get.toNamed(
          Routes.voiceCallScreen,
          arguments: {
            'channelName': channelName,
            'remoteUid': agoraUid,
            'token': token
          },
        );
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      printError(info: e.toString());
      Helper().showToast(e.toString());
    }
  }
}
