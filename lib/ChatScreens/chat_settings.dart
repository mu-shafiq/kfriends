import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class ChatSettings extends StatefulWidget {
  const ChatSettings({super.key});

  @override
  State<ChatSettings> createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 2),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.blueTick)),
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
      ),
      body: GetBuilder<ChatController>(builder: (controller) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.verticalSpace,
                  SizedBox(
                    width: .9.sw,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.chatRooms.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          ChatRoom chatRoom = controller.chatRooms[index];
                          return Stack(
                            children: [
                              FutureBuilder<UserModel>(
                                  future: Get.find<UsersController>()
                                      .getUser(chatRoom.userIds[0]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      UserModel? userModel = snapshot.data;
                                      return userModel != null
                                          ? ChatTile(
                                              chatCount: controller
                                                  .messages[chatRoom.id]!
                                                  .map((e) {
                                                    return e.readBy.contains(
                                                        currentUser!.id);
                                                  })
                                                  .toList()
                                                  .where((e) => !e)
                                                  .length,
                                              verified: userModel.userType ==
                                                  'korean',
                                              time: DateFormat('HH:mm').format(
                                                  DateTime.parse(
                                                          chatRoom.updatedAt!)
                                                      .toUtc()),
                                              asset: userModel.profileImage,
                                              username: userModel.nickname,
                                              lastchat: chatRoom.lastMsg,
                                            )
                                          : const SizedBox();
                                    } else {
                                      return SizedBox(
                                          height: .8.sh,
                                          width: 1.sw,
                                          child: const Center(
                                              child:
                                                  CircularProgressIndicator()));
                                    }
                                  }),
                              Positioned(
                                top: 15.h,
                                left: 8.w,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Deleting Chat?'),
                                          content: const SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    'After you press the approve button,'),
                                                Text(
                                                    'You will no longer be able to recover the chat.'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Approve'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller.deleteChatRoom(
                                                    chatRoom.id!);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Image.asset(
                                    Assets.crossblack,
                                    scale: 1.1.sp,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
