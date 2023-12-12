import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  bool chatRoomloading = false;
  UserModel? selectedUser;
  RxString chatTimeToDisplay =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  List<Message> selectedUserCha = [];
  ChatRoom? selectedChatRoom;
  List<ChatRoom> chatRooms = [];
  TextEditingController controller = TextEditingController();
  Map<String, List<Message>> messages = <String, List<Message>>{};

  setSelectedUser(UserModel userModel,
      {bool isNew = false, ChatRoom? chatRoom}) async {
    selectedUser = userModel;
    update();
    SocketNew.socket.off('new_message');
    SocketNew.socket.on('new_message', (data) {
      log('new message');
      Message message = Message.fromJson(data);
      List<Message> list = messages[message.chatRoomId] ?? [];
      list.add(message);
      list = list.toSet().toList();
      messages.addAllIf(
          message.senderId == selectedUser!.id, {message.chatRoomId: list});
      update();
    });
    isNew ? await initiateChatRoom() : setSelectedChatRoom(chatRoom!);

    update();
  }

  chatTimeToBeDisplayed(int index) {
    messages[selectedChatRoom!.id];
    List<Message> list = messages[selectedChatRoom!.id]!;
    Message message = list[index];
    chatTimeToDisplay.value = message.timeSent;
  }

  setSelectedChatRoom(ChatRoom chatRoom) {
    selectedChatRoom = chatRoom;
    unreadChat();
    loading = false;
    update();
  }

  unreadChat() async {
    messages[selectedChatRoom!.id]!.forEach(
      (element) => element.readBy
          .addIf(!element.readBy.contains(currentUser!.id), currentUser!.id),
    );
    update();
    try {
      Map<String, dynamic>? res = await mongodbController.patchDocument(
          'chatRoom', selectedChatRoom!.id!, {'readBy': currentUser!.id});
      if (res![Keys.status] == Keys.success) {
        print(res);
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      print(e);
      Helper().showToast("Error while unreading chat");
      return [];
    }
  }

  sendMessage({String type = 'text', String? url}) {
    Message message = Message(
        type: type,
        chatRoomId: selectedChatRoom!.id!,
        receiverId: selectedUser!.id!,
        msg: controller.text,
        attachmentUrl: url,
        readBy: [currentUser!.id],
        timeSent: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        senderId: Get.find<AuthController>().userModel!.id!,
        sort: DateTime.now().microsecondsSinceEpoch);

    SocketNew.sendMessageSocket(message);
    List<Message> list = messages[message.chatRoomId]!;
    list.add(message);
    list = list.toSet().toList();

    messages.addAll({message.chatRoomId: list});
    // selectedUserChat.add(message);
    controller.clear();
    update();
  }

  initiateChatRoom() async {
    loading = true;
    update();
    try {
      ChatRoom chatRoom = ChatRoom(
          chatInitiator: currentUser!.id!,
          userIds: [currentUser!.id, selectedUser!.id],
          lastMsg: 'Tap to start');
      Map<String, dynamic>? res =
          await mongodbController.postDocument('chatRoom', chatRoom.toJson());
      if (res![Keys.status] == Keys.success) {
        chatRoom = ChatRoom.fromJson(res[Keys.data]['chatRoom']);
        selectedChatRoom = chatRoom;
        List<Message> list =
            await getMessagesForChatRoom(selectedChatRoom!.id!);
        messages.addAll({chatRoom.id!: list});
        loading = false;
        update();
      } else {
        loading = false;
        update();
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      print(e);
      loading = false;
      update();
      Helper().showToast("Error in initiating chat room");
    }
    getMyChatRooms();
    update();
  }

  deleteChatRoom(String chatRoomID) async {
    EasyLoading.show();
    try {
      Map<String, dynamic>? res =
          await mongodbController.deleteDocument('chatRoom', chatRoomID);
      if (res![Keys.status] == Keys.success) {
        chatRooms.removeWhere((element) => element.id == chatRoomID);
        messages.remove(chatRoomID);
        update();
        Helper().showToast("Chat deleted successfully.");
        EasyLoading.dismiss();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      Helper().showToast("Error in deleting chat");
    }
  }

  Future<List<Message>> getMessagesForChatRoom(String chatRoomID) async {
    try {
      Map<String, dynamic>? res =
          await mongodbController.getDocument('chats', chatRoomID);
      if (res![Keys.status] == Keys.success) {
        return List.from(res[Keys.data][Keys.message]).map((e) {
          return Message.fromJson(e);
        }).toList();
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      Helper().showToast("Error while loading messages");
      return [];
    }
  }

  Future<void> getMyChatRooms() async {
    try {
      chatRoomloading = true;
      chatRooms.clear();
      update();

      Map<String, dynamic>? res =
          await mongodbController.getDocument('chatRoom', currentUser!.id!);

      if (res![Keys.status] == Keys.success) {
        for (var element in res[Keys.data]['chatRooms']) {
          ChatRoom chatRoom = ChatRoom.fromJson(element);
          chatRooms.add(chatRoom);
          List<Message> list = await getMessagesForChatRoom(chatRoom.id!);

          messages.addAll({chatRoom.id!: list});
          update();
        }
        chatRoomloading = false;
        update();
      } else {
        chatRoomloading = false;
        update();
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      print('5');

      chatRoomloading = false;
      update();
      Helper().showToast("Error while loading chats");
    }
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
