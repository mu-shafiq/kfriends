import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/comment_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/model/user.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  int selected = 0;
  final bool isEnglish = Get.locale == const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      UserModel myInfo = controller.userModel!;
      return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: const SizedBox(),
          centerTitle: true,
          title: Text(
            'MY HOME'.tr,
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
            children: [
              5.verticalSpace,
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 1.sw,
                    height: .3.sh,
                    child: Image.network(
                      myInfo.featuredImage,
                      scale: .5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    child: CircleAvatar(
                      radius: 70.r,
                      backgroundImage: Image.network(
                        myInfo.profileImage,
                        fit: BoxFit.fill,
                        scale: .5,
                      ).image,
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    child: SizedBox(
                      height: 22.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: myInfo.interests!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: interest(myInfo.interests![index]),
                            );
                          }),
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myInfo.username,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${myInfo.age} / ${myInfo.gender.toUpperCase().tr} / ${myInfo.country}',
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 12.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.15,
                      ),
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.followers,
                          arguments: myInfo.followers);
                    },
                    child: Row(
                      children: [
                        Text(
                          myInfo.followers.length.toString(),
                          style: TextStyle(
                            color: textPinkColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        3.horizontalSpace,
                        Text(
                          'Followers'.tr,
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
                  ),
                  30.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.followings,
                          arguments: myInfo.following);
                    },
                    child: Row(
                      children: [
                        Text(
                          myInfo.following.length.toString(),
                          style: TextStyle(
                            color: textBlueColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        3.horizontalSpace,
                        Text(
                          'Following'.tr,
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
                  ),
                  30.horizontalSpace,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '49,000 ',
                          style: TextStyle(
                            color: textYellowColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Points'.tr,
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
                ],
              ),
              25.verticalSpace,
              Text(
                myInfo.intro ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 12.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                ),
              ),
              40.verticalSpace,
              isEnglish
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedSmallButton(
                          selected: selected == 0,
                          onTap: () {
                            setState(() {
                              selected = 0;
                            });
                          },
                          textColor: textBlackColor,
                          width: 160.w,
                          height: 30.h,
                          text: 'COMMENTS',
                          unselectedtextColor: textBlackColor,
                        ),
                        10.horizontalSpace,
                        RoundedSmallButton(
                          selected: selected == 1,
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                          },
                          textColor: textBlackColor,
                          width: 160.w,
                          height: 30.h,
                          text: 'PRACTICE',
                          unselectedtextColor: textBlackColor,
                        ),
                      ],
                    )
                  : const SizedBox(),
              isEnglish ? 30.verticalSpace : 10.verticalSpace,
              selected == 0
                  ? SizedBox(
                      width: .9.sw,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const CommentTile(
                              time: '6 Days ago',
                              verified: true,
                              asset: Assets.user1,
                              username: '김민준',
                              comment: '안녕하세요! 반가워요!대화 걸어주세요~',
                            );
                          }),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: .87.sw,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'English Proficiency',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              RoundedSmallButton(
                                  height: 22.h,
                                  width: 80.w,
                                  text: 'Advanced',
                                  textColor: textBlueColor,
                                  unselectedtextColor: textBlueColor,
                                  onTap: () {})
                            ],
                          ),
                        ),
                        5.verticalSpace,
                        SizedBox(
                          width: .87.sw,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Korean Proficiency',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              RoundedSmallButton(
                                  height: 22.h,
                                  width: 80.w,
                                  text: 'Beginner',
                                  textColor: textBlueColor,
                                  unselectedtextColor: textYellowColor,
                                  onTap: () {})
                            ],
                          ),
                        ),
                        5.verticalSpace,
                        SizedBox(
                          width: .87.sw,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Studied Words',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              RoundedSmallButton(
                                  height: 22.h,
                                  width: 80.w,
                                  text: '3,596',
                                  textColor: textBlueColor,
                                  unselectedtextColor: textPinkColor,
                                  onTap: () {})
                            ],
                          ),
                        ),
                        5.verticalSpace,
                        SizedBox(
                          width: .87.sw,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Call Duration',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              RoundedSmallButton(
                                  height: 22.h,
                                  width: 80.w,
                                  text: '2h 37m',
                                  textColor: textBlueColor,
                                  unselectedtextColor: textPinkColor,
                                  onTap: () {})
                            ],
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
      );
    });
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
