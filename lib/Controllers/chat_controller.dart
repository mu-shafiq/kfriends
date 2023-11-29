import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Utils/socket.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/model/user.dart';

import '../model/message.dart';

class ChatController extends GetxController {
  MongoDBController mongodbController = Get.find<MongoDBController>();

  bool loading = true;
  UserModel? selectedUser;
  List<Message> selectedUserChat = [];
  TextEditingController controller = TextEditingController();

  setSelectedUser(UserModel userModel) {
    selectedUser = userModel;
    SocketNew.socket.on('new_message', (data) {
      selectedUserChat.add(Message.fromJson(data));
      update();
    });
    loading = true;
    update();
  }

  sendMessage({String type = 'text', String? url}) {
    Message message = Message(
        type: type,
        recieverId: selectedUser!.id!,
        msg: controller.text,
        attachmentUrl: url,
        timeSent: DateTime.now().toString(),
        senderId: Get.find<AuthController>().userModel!.id!,
        sort: DateTime.now().microsecondsSinceEpoch);

    SocketNew.sendMessageSocket(message);
    selectedUserChat.add(message);
    controller.clear();
    update();
  }

  getAllMessages({List<String>? queries}) async {
    try {
      Map<String, dynamic>? res =
          await mongodbController.getCollection('chats', queries: [
        'sender_id=${currentUser!.id}',
      ]);
      if (res![Keys.status] == Keys.success) {
        log(res[Keys.data].toString());
        selectedUserChat = List.from(res[Keys.data][Keys.message]).map((e) {
          return Message.fromJson(e);
        }).toList();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast("Error in getting messages");
    }
    update();
  }
}
