import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/ImageView/image_view.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Controllers/chat_controller.dart';
import 'package:kfriends/model/message.dart';

class ChatingScreen extends StatefulWidget {
  const ChatingScreen({super.key});

  @override
  State<ChatingScreen> createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        Get.snackbar('Load more', 'Tap here to load more', onTap: (snack) {
          print('snack is pressed');
        }, duration: const Duration(seconds: 3));
      }
      int index = (_scrollController.offset / 50).round();
      Get.find<ChatController>().chatTimeToBeDisplayed(index);
    });
    super.initState();
  }

  bool isKeyboardOpen = false;

  @override
  void didChangeMetrics() {
    final isKeyboardOpenNow =
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    setState(() {
      isKeyboardOpen = isKeyboardOpenNow;
    });
  }

  @override
  void dispose() {
    1.seconds.delay().then((value) {
      Get.find<ChatController>().unreadChat();
      WidgetsBinding.instance.removeObserver(this);
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      1.seconds.delay().then((value) {
        controller.loading == false
            ? _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              )
            : null;
      });
      return Scaffold(
        bottomNavigationBar: const BottomBar(index: 1),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(Assets.backArrow)),
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 15.r,
                  backgroundImage:
                      Image.network(controller.selectedUser!.profileImage)
                          .image),
              3.horizontalSpace,
              Text(
                controller.selectedUser!.nickname,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 10.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.reportScreen);
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Image.asset(Assets.more),
                  )),
            )
          ],
        ),
        body: controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: .81.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffFFFFFF),
                      Color(0xffFFF6E2),
                      Color(0xffFFE6AF),
                      Color(0xffFFE6AF)
                    ])),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Text(
                          controller.chatTimeToDisplay.toString(),
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: isKeyboardOpen ? .41.sh : .7.sh,
                            width: .94.sw,
                            child: ListView.builder(
                                controller: _scrollController,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: controller
                                    .messages[controller.selectedChatRoom!.id]!
                                    .length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Message message = controller.messages[
                                      controller.selectedChatRoom!.id]![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 8),
                                    child: messageTile(
                                        message.msg,
                                        message.senderId !=
                                            Get.find<AuthController>()
                                                .userModel!
                                                .id,
                                        '15:43',
                                        '15:43',
                                        message.type,
                                        message.attachmentUrl.toString(),
                                        controller.selectedUser!.profileImage),
                                  );
                                }),
                          ),
                          20.verticalSpace,
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: .94.sw,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            color: bgWhiteColor,
                                            height: 120.h,
                                            width: 1.sw,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    child: Text(
                                                      'Camera',
                                                      style: TextStyle(
                                                          color: textBlackColor,
                                                          fontSize: 15.sp),
                                                    ),
                                                    onPressed: () async {
                                                      Get.back();
                                                      File? file =
                                                          await Helper()
                                                              .imagePicker(
                                                                  ImageSource
                                                                      .camera);
                                                      if (file != null) {
                                                        String url = (await Helper()
                                                            .uploadImage(file,
                                                                Keys.profileImage))!;
                                                        controller.sendMessage(
                                                            type: 'url',
                                                            url: url);
                                                      }
                                                    }),
                                                TextButton(
                                                    child: Text(
                                                      'Gallery',
                                                      style: TextStyle(
                                                          color: textBlackColor,
                                                          fontSize: 15.sp),
                                                    ),
                                                    onPressed: () async {
                                                      Get.back();
                                                      File? file =
                                                          await Helper()
                                                              .imagePicker(
                                                                  ImageSource
                                                                      .gallery);
                                                      if (file != null) {
                                                        String url = (await Helper()
                                                            .uploadImage(file,
                                                                Keys.profileImage))!;
                                                        controller.sendMessage(
                                                            type: 'url',
                                                            url: url);
                                                      }
                                                    }),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Image.asset(
                                    Assets.add,
                                    scale: .8,
                                  ),
                                ),
                                6.horizontalSpace,
                                CustomTextfield(
                                    height: 40.h,
                                    width: .80.sw,
                                    hintSize: 10.sp,
                                    trailing: InkWell(
                                        onTap: () {
                                          controller.sendMessage();
                                        },
                                        child: const Icon(
                                          Icons.send,
                                          color: textPinkColor,
                                        )),
                                    hint: 'Enter your message here💬'.tr,
                                    controller: controller.controller)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  Widget messageTile(String text, bool isme, String time1, String time2,
      String type, String url, String photo) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment:
            isme ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isme
              ? CircleAvatar(
                  radius: 12.r,
                  backgroundImage: Image.network(photo).image,
                )
              : const SizedBox(),
          5.horizontalSpace,
          !isme
              ? Column(
                  children: [
                    Text(
                      time1,
                      style: TextStyle(
                        color: const Color(0xFF41B6DB),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      time2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.30000001192092896),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                )
              : const SizedBox(),
          !isme ? 5.horizontalSpace : 0.horizontalSpace,
          Container(
            decoration: ShapeDecoration(
              color: isme ? const Color(0xFFFAFAFA) : const Color(0xFFFFB45B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: SizedBox(
              width: .35.sw,
              child: type == 'url'
                  ? GestureDetector(
                      onTap: () {
                        Get.to(ImageView(url: url),
                            transition: Transition.downToUp,
                            curve: Curves.bounceIn,
                            duration: const Duration(milliseconds: 700));
                      },
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 5),
                      child: Text(
                        text,
                        maxLines: null,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
            ),
          ),
          5.horizontalSpace,
          isme
              ? Column(
                  children: [
                    Text(
                      time1,
                      style: TextStyle(
                        color: const Color(0xFF41B6DB),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      time2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.30000001192092896),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
