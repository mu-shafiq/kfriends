import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(index: 0),
        body: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 35,
                      width: 35,
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
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(Assets.backArrow))),
                  Container(
                    decoration: ShapeDecoration(
                      color: buttonWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: buttonBlackShadow1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: buttonBlackShadow2,
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offAndToNamed(Routes.bottomNavBar);
                            },
                            child: Container(
                              width: 110.w,
                              height: 26.h,
                              decoration: null,
                              child: GestureDetector(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PRACTICE ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 10.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    3.horizontalSpace,
                                    Text(
                                      '✍️',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: textYellowColor,
                                          fontSize: 15.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: -0.5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 110.w,
                              height: 26.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                gradient: const LinearGradient(
                                    end: Alignment.center,
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 243, 240, 240)
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  'COMMUNITY 🌏',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textBlueColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '49,000 ',
                              style: TextStyle(
                                color: Color(0xFFFFCC00),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'P',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 49.w,
                        height: 1,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              30.verticalSpace,
              Container(
                alignment: Alignment.centerLeft,
                child: RoundedSmallButton2(
                  onTap: () {},
                  textColor: textBlackColor,
                  shadow1: buttonBlackShadow1,
                  shadow2: buttonBlackShadow2,
                  bgColor: buttonWhiteColor,
                  width: 80.w,
                  height: 25.h,
                  text: '#K-CULTURE',
                  selected: true,
                ),
              ),
              10.verticalSpace,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My First visit to Gyeongbokgung! ',
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0.w),
                child: Container(
                  height: .65.sh,
                  width: .9.sw,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 10.r,
                                    child: Image.asset(Assets.user1)),
                                5.horizontalSpace,
                                Text(
                                  '주희',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textBlackColor,
                                    fontSize: 9.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '2023.06.16',
                                  style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 8.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(Assets.delete),
                                20.horizontalSpace,
                                Image.asset(Assets.edit),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: .4.sh,
                        width: .9.sw,
                        child: Image.asset(
                          Assets.postimage2,
                          scale: .5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      10.verticalSpace,
                      SizedBox(
                        height: .13.sh,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Seoul is one of the hottest travel destinations in Asia offering a vibrant mix of old and new. The city has been the capital of Korea during many dynasties and is, therefore, home to various historic attractions. Moreover, the city is constantly changing with new architectural gems popping up year after year, such as Lotte World Tower, the tallest building in South Korea, or the Dongdaemun Design Plaza by award-winning architect Zaha Hadid. The cost of living in Seoul is also rising continuously but there are still lots of things do to in the city that you don’t have to break the bank for. Here are 25 free things to do in Seoul.Many say you haven’t really seen Seoul if you didn’t visit Gyeongbukgung Palace. Built in 1395, Gyeongbokgung is the largest and most important palace out of the five grand palaces in Seoul and probably the number one attraction in the city. While there is an admission fee of 3,000 Korean Won, you can get free admission to the palace when wearing Korean hanbok. Thousands of local and foreign tourists rent hanbok when visiting the city for the unique experience and memorable travel photos and getting into Gyeongbokgung Palace and other attractions around Seoul for free is an added bonus.',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              10.horizontalSpace,
                              Image.asset(
                                Assets.more,
                                scale: 1.5.sp,
                              ),
                              10.horizontalSpace,
                              Text(
                                'Back to List',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.15,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(),
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.like,
                                    scale: 1.sp,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontSize: 11.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  10.horizontalSpace
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.comment,
                                    scale: 1.sp,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontSize: 11.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  10.horizontalSpace
                                ],
                              ),
                              const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
