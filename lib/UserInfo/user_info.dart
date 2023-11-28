import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/chat_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/comment_tile2.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/model/user.dart';

class UserInfo extends StatelessWidget {
  final UserModel user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(
        index: 1,
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(Assets.backArrow),
          ),
        ),
        centerTitle: true,
        title: Text(
          'PROFILE'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textBlackColor,
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: GetBuilder<UsersController>(
          init: UsersController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  5.verticalSpace,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 1.sw,
                        height: .3.sh,
                        child: Image.network(
                          user.featuredImage,
                          scale: .5,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              Assets.joinFormImage,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        child: CircleAvatar(
                          radius: 70.r,
                          backgroundImage: Image.network(
                            user.profileImage,
                            fit: BoxFit.contain,
                            scale: .5,
                            errorBuilder: (context, error, stackTrace) {
                              return CircleAvatar(
                                radius: 70.r,
                                backgroundImage: Image.asset(
                                  Assets.user1,
                                  fit: BoxFit.cover,
                                  scale: .1,
                                ).image,
                              );
                            },
                          ).image,
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                        child: Wrap(
                          spacing: 6.w,
                          runSpacing: 6.h,
                          children: user.interests == null
                              ? []
                              : user.interests!
                                  .map((e) => interest(e))
                                  .toList(),
                        ),
                      )
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        GetUtils.capitalizeFirst(user.username)!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 16.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        '${user.age} / ${user.gender.toUpperCase().tr} / ${user.country}',
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.15,
                        ),
                      )
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${user.followers.length} ',
                              style: TextStyle(
                                color: textPinkColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Followers'.tr,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      30.horizontalSpace,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${user.following.length} ',
                              style: TextStyle(
                                color: textBlueColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Following'.tr,
                              style: TextStyle(
                                color: textBlueColor,
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      30.horizontalSpace,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '999 ',
                              style: TextStyle(
                                color: textYellowColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Points',
                              style: TextStyle(
                                color: textYellowColor,
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  25.verticalSpace,
                  SizedBox(
                    width: .7.sw,
                    child: Text(
                      user.intro ?? "",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 12.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedSmallButton(
                        icon: Image.asset(Assets.following),
                        selected: user.followers.contains(currentUser!.id),
                        onTap: () async {
                          if (user.followers.contains(currentUser!.id)) {
                            bool res = await controller.unFollowUser(user.id!);
                            if (res) {
                              user.followers.remove(currentUser!.id);
                            }
                          } else {
                            bool res = await controller.followUser(user.id!);
                            if (res) {
                              user.followers.add(currentUser!.id!);
                            }
                          }
                          controller.update();
                        },
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: user.followers.contains(currentUser!.id)
                            ? 'Following'.tr
                            : 'Follow'.tr,
                      ),
                      10.horizontalSpace,
                      RoundedSmallButton(
                        icon: Image.asset(Assets.privatechat),
                        onTap: () {
                          Get.find<ChatController>().setSelectedUser(user);
                          Get.toNamed(Routes.chatingScreen);
                        },
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Private Chat'.tr,
                      ),
                      10.horizontalSpace,
                      RoundedSmallButton(
                        icon: Image.asset(Assets.outgoing),
                        onTap: () {
                          Get.toNamed(Routes.incomingCall);
                        },
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Call'.tr,
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  SizedBox(
                    width: .9.sw,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const CommentTile2(
                            time: '6 Days ago',
                            verified: true,
                            asset: Assets.user1,
                            username: '김민준',
                            comment: '안녕하세요! 반가워요!대화 걸어주세요~',
                          );
                        }),
                  ),
                  30.verticalSpace,
                  CustomTextfield(
                      height: 40.h,
                      width: .9.sw,
                      hintSize: 10.sp,
                      hint: 'Leave your comment'.tr,
                      controller: TextEditingController()),
                  30.verticalSpace,
                ],
              ),
            );
          }),
    );
  }

  Widget interest(String e) {
    return Container(
      width: 80,
      height: 22,
      decoration: ShapeDecoration(
        color: e.toLowerCase().contains('food')
            ? food
            : e.toLowerCase().contains('travel')
                ? travel
                : e.toLowerCase().contains('game')
                    ? game
                    : e.toLowerCase().contains('culture')
                        ? culture
                        : e.toLowerCase().contains('beauty')
                            ? beauty
                            : e.toLowerCase().contains('pop')
                                ? pop
                                : e.toLowerCase().contains('pet')
                                    ? pet
                                    : const Color(0xFF09E1FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            e,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textBlackColor,
              fontSize: 10.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
