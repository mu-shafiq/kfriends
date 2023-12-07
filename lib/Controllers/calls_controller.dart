import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/model/call_logs.dart';

class CallsController extends GetxController {
  final mongodbController = Get.find<MongoDBController>();

  Future<List<CallLogModel>> getCallLogs() async {
    try {
      EasyLoading.show();
      Map<String, dynamic>? res =
          await mongodbController.getCollection('callLogs', queries: [
        'userId=${Get.find<AuthController>().userModel!.id}',
        'sort=createdAt:-1',
        'populate=contactId, callId'
      ]);
      EasyLoading.dismiss();
      log("res: ${res![Keys.data][Keys.callLogs][0]['callId']['duration'].runtimeType}");
      if (res[Keys.status] == Keys.success) {
        return (res[Keys.data][Keys.callLogs] as List)
            .map((e) => CallLogModel.fromMap(e as Map<String, dynamic>))
            .toList();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      printError(info: e.toString());
      Helper().showToast(e.toString());
    }
    return [];
  }

  Future<void> makeACall(String receiverUserId) async {
    try {
      EasyLoading.show();
      Map<String, dynamic>? res = await mongodbController.callFunction(
        Keys.makeCall,
        data: {
          'receiverUserId': receiverUserId,
        },
      );
      EasyLoading.dismiss();
      if (res![Keys.status] == Keys.success) {
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

  Future<void> buyMoreTime() async {
    try {
      int timeInMinutes = 5;
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast(e.toString());
    }
  }
}
