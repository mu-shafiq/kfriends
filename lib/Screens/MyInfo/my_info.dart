import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/comment_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          'MY HOME',
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
              Get.toNamed(Routes.profileSettings);
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
                Image.asset(
                  Assets.cover,
                  scale: .5,
                ),
                Positioned(
                  bottom: 20.h,
                  child: CircleAvatar(
                    radius: 70.r,
                    child: Image.asset(
                      Assets.user1,
                      fit: BoxFit.contain,
                      scale: .5,
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      interest(const Color(0xFF09E1FF), '#K-TRAVEL'),
                      5.horizontalSpace,
                      interest(const Color(0xFFFFF515), '#K-FOOD'),
                      5.horizontalSpace,
                      interest(const Color(0xFFFF8515), 'GAME'),
                    ],
                  ),
                )
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Joseph',
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
                    '33 / MALE / Canada',
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
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '999 ',
                        style: TextStyle(
                          color: textPinkColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'Followers',
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
                        text: '999 ',
                        style: TextStyle(
                          color: textBlueColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'Following',
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
                        text: 'Points',
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
              'Hi, Nice to meet you guys. I’m looking for new friends!',
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
            Row(
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
            ),
            30.verticalSpace,
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
  }

  Widget interest(Color color, String interest) {
    return Container(
      width: 80,
      height: 22,
      decoration: ShapeDecoration(
        color: color,
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
            interest,
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
