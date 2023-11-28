import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/socket.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/model/user.dart';

import '../model/message.dart';

class ChatController extends GetxController {
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

  sendMessage() {
    if (controller.text.isNotEmpty) {
      SocketNew.sendMessageSocket(selectedUser!.id,
          Get.find<AuthController>().userModel!.id, controller.text);
      selectedUserChat.add(Message(
          type: 'text',
          recieverId: selectedUser!.id!,
          msg: controller.text,
          timeSent: DateTime.now(),
          senderId: Get.find<AuthController>().userModel!.id!,
          sort: DateTime.now().microsecondsSinceEpoch));
      controller.clear();
      update();
    }
  }
}
