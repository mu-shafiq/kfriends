import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';

class KoreanGameResult extends StatefulWidget {
  const KoreanGameResult({super.key});

  @override
  State<KoreanGameResult> createState() => _TopikTestResultState();
}

class _TopikTestResultState extends State<KoreanGameResult> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.backArrow)),
            title: Text(
              'SEASON1 (계절1)',
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
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            ),
                          ),
                          TextSpan(
                            text: 'P',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
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
                ),
              )
            ],
          ),
          bottomNavigationBar: const BottomBar(index: 0),
          body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                RoundedButton(
                    bgColor: buttonBlackColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    height: 30.h,
                    width: 120.w,
                    text: 'RESULT',
                    textColor: textYellowColor,
                    onTap: () {}),
                40.verticalSpace,
                Text(
                  'YOUR SCORE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 16.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                10.verticalSpace,
                Text(
                  '80.0 / 100',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 16.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '(+ ',
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '10',
                        style: TextStyle(
                          color: const Color(0xFFDAC632),
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' Point)',
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                30.verticalSpace,
                Text(
                  'WELL DONE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 24.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'You can do better with Korean Friends!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 12.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
                .35.sh.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RoundedButton(
                      onTap: () {
                        Get.back();
                      },
                      textColor: const Color(0xFF888888),
                      bgColor: const Color(0xFFF5F5F5),
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      width: 110.w,
                      height: 30.h,
                      text: 'Try Again',
                    ),
                    50.horizontalSpace,
                    RoundedSmallButton(
                      selected: true,
                      selectedColor: buttonBlueColor2,
                      onTap: () {
                        Get.back();
                        Get.back();

                        Get.back();
                        Get.back();
                      },
                      textColor: textWhiteColor,
                      width: 110.w,
                      height: 30.h,
                      text: 'Next Game →',
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
