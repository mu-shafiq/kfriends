import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/comment_tile2.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

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
          'PROFILE',
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
                Text(
                  '33 / MALE / Canada',
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
                        text: '999 ',
                        style: TextStyle(
                          color: textPinkColor,
                          fontSize: 10.sp,
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
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'Following',
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
                'I live in Brazil now, but I’ll go South Korean next year!한국어를 공부하는 학생입니다.',
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
                  selected: true,
                  onTap: () {},
                  textColor: textBlackColor,
                  width: 106.w,
                  height: 30.h,
                  text: 'Following',
                ),
                10.horizontalSpace,
                RoundedSmallButton(
                  icon: Image.asset(Assets.privatechat),
                  onTap: () {},
                  textColor: textBlackColor,
                  width: 106.w,
                  height: 30.h,
                  text: 'Private Chat',
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
                  text: 'Call',
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
                hint: 'Leave your comment',
                controller: TextEditingController()),
            30.verticalSpace,
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
