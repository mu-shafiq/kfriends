import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/model/user.dart';

import '../Routes/get_routes.dart';
import '../Widgets/user_tile.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (userController) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.koreanMainScreen);
                  },
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: .90.sw,
                        child: Image.asset(
                          Assets.koreangame,
                          scale: .1,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                10.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.topikMainScreen);
                  },
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: .96.sw,
                        child: Image.asset(
                          Assets.topikpractice,
                          scale: .06,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Suggested Korean Friends!",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textBlackColor,
                        height: 17 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton2(
                        onTap: () {
                          print('object');
                          userController.updateSuggestedInterests('#K-CULTURE');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#K-CULTURE',
                        selected: userController.suggestedInterests
                            .contains('#K-CULTURE'),
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#K-POP');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#K-POP',
                        selected: userController.suggestedInterests
                            .contains('#K-POP'),
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#K-DRAMA');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        selected: userController.suggestedInterests
                            .contains('#K-DRAMA'),
                        text: '#K-DRAMA',
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#K-FOOD');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#K-FOOD',
                        selected: userController.suggestedInterests
                            .contains('#K-FOOD'),
                      ),
                    ],
                  ),
                ),
                12.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#K-TRAVEL');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        selected: userController.suggestedInterests
                            .contains('#K-TRAVEL'),
                        text: '#K-TRAVEL',
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#K-BEAUTY');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#K-BEAUTY',
                        selected: userController.suggestedInterests
                            .contains('#K-BEAUTY'),
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          userController.updateSuggestedInterests('#PET');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#PET',
                        selected:
                            userController.suggestedInterests.contains('#PET'),
                      ),
                      RoundedSmallButton2(
                        onTap: () {
                          print('message');
                          userController.updateSuggestedInterests('#GAME');
                        },
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 81.w,
                        height: 25.h,
                        text: '#GAME',
                        selected:
                            userController.suggestedInterests.contains('#GAME'),
                      ),
                    ],
                  ),
                ),
                15.verticalSpace,
              ],
            ),
          ),
          SizedBox(
            height: .19.sh,
            width: 1.sw,
            child: FutureBuilder<List<UserModel>>(
                future: userController.getFriends(queries: [
                  'userType=$korean',
                  'interests[in]=${userController.suggestedInterests.join(",")}'
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<UserModel> users = snapshot.data ?? [];
                    return users.isNotEmpty
                        ? ListView.builder(
                            itemCount: users.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.userInfo,
                                      arguments: currentUser);
                                },
                                child: const UserTile(
                                  verified: true,
                                  asset: Assets.user1,
                                  username: '김민준',
                                  about: '안녕하세요! 반가워요!대화 걸어주세요~',
                                  followers: 999,
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              'No Suggestions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 10.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          );
                  } else {
                    return CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15.h,
                        child: const CircularProgressIndicator());
                  }
                }),
          )
        ],
      );
    });
  }
}
