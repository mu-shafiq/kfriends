import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/socket.dart';
import 'package:kfriends/controllers/chat_controller.dart';
import 'package:kfriends/model/user.dart';

class UserTile2 extends StatelessWidget {
  final String asset;
  final String username;
  final String about;
  final bool verified;
  final int? agoraUid;
  final UserModel userModel;

  const UserTile2({
    super.key,
    required this.asset,
    required this.username,
    required this.about,
    required this.verified,
    required this.userModel,
    this.agoraUid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: .9.sw,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: ListTile(
            horizontalTitleGap: 5.w,
            contentPadding: EdgeInsets.only(
                left: 5.w, top: 10.h, bottom: 10.h, right: 10.w),
            leading: CircleAvatar(
              radius: 35.r,
              backgroundImage: Image.asset(
                asset,
              ).image,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    3.horizontalSpace,
                    verified ? Image.asset(Assets.verified) : const SizedBox()
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 110.w,
                  height: 30.h,
                  child: Text(
                    about,
                    maxLines: 3,
                    style: TextStyle(
                        color: textBlackColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 70.w,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.find<ChatController>().setSelectedUser(userModel);
                        Get.toNamed(Routes.chatingScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        child: Image.asset(Assets.message),
                      )),
                  10.horizontalSpace,
                  GetBuilder<CallsController>(
                      init: CallsController(),
                      builder: (controller) {
                        return InkWell(
                          onTap: () async {
                            if (agoraUid == null) {
                              Helper().showToast("User Needs to login first");
                              return;
                            }
                            await controller.makeACall(
                              userModel.id!,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFF5F5F5),
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Image.asset(
                                Assets.call,
                                scale: 1.9.sp,
                                color: textBlackColor,
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
