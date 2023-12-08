import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/followTile.dart';
import 'package:kfriends/model/user.dart';

class Followers extends StatelessWidget {
  final List<String> followers;
  const Followers({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: UsersController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(Assets.backArrow)),
                centerTitle: true,
                title: Text(
                  'MY FOLLOWERS'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 14.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.profileSetting);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(Assets.settings),
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: .92.sw,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: followers.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FutureBuilder<UserModel>(
                                  future: controller.getUser(followers[index]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: SizedBox(),
                                      );
                                    }

                                    UserModel user = snapshot.data!;

                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.userInfo,
                                            arguments: user);
                                      },
                                      child: FollowTile(
                                        verified: user.userType == korean,
                                        asset: user.profileImage,
                                        username: user.nickname,
                                        about: user.intro!,
                                        userModel: user,
                                      ),
                                    );
                                  });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
