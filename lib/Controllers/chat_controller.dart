import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Utils/socket.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/model/chat_room.dart';
import 'package:kfriends/model/user.dart';

import '../model/message.dart';

class ChatController extends GetxController {
  MongoDBController mongodbController = Get.find<MongoDBController>();

  bool loading = true;
  UserModel? selectedUser;
  List<Message> selectedUserChat = [];
  ChatRoom? selectedChatRoom;
  List<ChatRoom> chatRooms = [];
  TextEditingController controller = TextEditingController();

  setSelectedUser(UserModel userModel,
      {bool isNew = false, ChatRoom? chatRoom}) async {
    loading == true;
    selectedUserChat.clear();
    update();
    log(isNew.toString());
    selectedUser = userModel;
    SocketNew.socket.on('new_message', (data) {
      Message message = Message.fromJson(data);
      selectedUserChat.addIf(message.senderId == selectedUser!.id, message);
      update();
    });
    isNew ? await initiateChatRoom() : setSelectedChatRoom(chatRoom!);
    await getAllMessages();

    loading = false;
    update();
  }

  setSelectedChatRoom(ChatRoom chatRoom) {
    selectedChatRoom = chatRoom;

    update();
  }

  sendMessage({String type = 'text', String? url}) {
    Message message = Message(
        type: type,
        chatRoomId: selectedChatRoom!.id!,
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
          await mongodbController.getDocument('chats', selectedChatRoom!.id!);
      if (res![Keys.status] == Keys.success) {
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

  initiateChatRoom() async {
    try {
      ChatRoom chatRoom = ChatRoom(
          chatInitiator: currentUser!.id!,
          userIds: [currentUser!.id, selectedUser!.id],
          lastMsg: 'Tap to start');
      Map<String, dynamic>? res =
          await mongodbController.postDocument('chatRoom', chatRoom.toJson());
      if (res![Keys.status] == Keys.success) {
        log(res[Keys.data].toString());
        selectedChatRoom = ChatRoom.fromJson(res[Keys.data]['chatRoom']);
        update();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      log(e.toString());
      Helper().showToast("Error in initiating chat room");
    }
    getMyChatRooms();
    update();
  }

  getMyChatRooms() async {
    try {
      log(currentUser!.id!);
      Map<String, dynamic>? res =
          await mongodbController.getDocument('chatRoom', currentUser!.id!);
      if (res![Keys.status] == Keys.success) {
        chatRooms = List.from(res[Keys.data]['chatRooms']).map((e) {
          return ChatRoom.fromJson(e);
        }).toList();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      log(e.toString());
      Helper().showToast("Error in getting chat room");
    }
    update();
  }

  @override
  void onInit() {
    3.seconds.delay().then((value) {
      if (currentUser != null) {
        getMyChatRooms();
      }
    });
    super.onInit();
  }
}
