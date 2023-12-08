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
import 'package:kfriends/Controllers/chat_controller.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/model/user.dart';

class FollowTile extends StatelessWidget {
  final String asset;
  final String username;
  final String about;
  final bool verified;
  final UserModel userModel;

  const FollowTile({
    super.key,
    required this.asset,
    required this.username,
    required this.about,
    required this.verified,
    required this.userModel,
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
              backgroundImage: Image.network(
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
                    onTap: () async {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: RoundedSmallButton(
                          height: 25.h,
                          width: 60.w,
                          text: 'Unfollow',
                          textColor: textBlueColor,
                          onTap: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
