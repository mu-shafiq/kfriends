import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/chat_controller.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/chat_tile.dart';
import 'package:kfriends/model/chat_room.dart';
import 'package:kfriends/model/user.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: const BottomBar(index: 1),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.chatSettings);
              },
              child: Image.asset(Assets.settings)),
          title: Text(
            'MY CHAT'.tr,
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
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Image.asset(Assets.cross)),
            )
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            // controller.getMyChatRooms();
            Get.toNamed(Routes.aiChat);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(Assets.aiFriend),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.verticalSpace,
                  SizedBox(
                    width: .94.sw,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.chatRooms.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          ChatRoom chatRoom = controller.chatRooms[index];
                          chatRoom.userIds.remove(currentUser!.id);
                          log(chatRoom.userIds.toString());
                          return FutureBuilder<UserModel>(
                              future: Get.find<UsersController>()
                                  .getUser(chatRoom.userIds[0]),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  UserModel userModel = snapshot.data!;
                                  return GestureDetector(
                                    onTap: () {
                                      controller.setSelectedUser(userModel,
                                          chatRoom: chatRoom);

                                      Get.toNamed(Routes.chatingScreen);
                                    },
                                    child: ChatTile(
                                      chatCount: 2,
                                      verified: userModel.userType == 'korean',
                                      time: '19:43',
                                      asset: userModel.profileImage,
                                      username: userModel.nickname,
                                      lastchat:
                                          '내가 좋아하는 한국 가수는 아이유야! 아이유 노래 혹시들어봤어?? 안 들어봤다면 진짜 꼭 들어봐!!!!',
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
