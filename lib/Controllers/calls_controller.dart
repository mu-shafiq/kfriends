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
        String callId = res[Keys.data][Keys.callId];
        String receiverName = res[Keys.data][Keys.receiverName];
        String receiverImage = res[Keys.data][Keys.receiverImage];
        Get.toNamed(
          Routes.voiceCallScreen,
          arguments: {
            'channelName': channelName,
            'remoteUid': agoraUid,
            'token': token,
            'callId': callId,
            'receiverName': receiverName,
            'receiverImage': receiverImage,
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

  Future<void> endsACall(String callId, String callLogType) async {
    try {
      Map<String, dynamic>? res = await mongodbController.callFunction(
        Keys.endCall,
        data: {
          'callId': callId,
          'callLogType': callLogType,
        },
      );
      if (res![Keys.status] == Keys.success) {
        // Get.back();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast(e.toString());
    }
  }
}
