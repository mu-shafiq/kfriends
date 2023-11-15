import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';

class TopikTestResult extends StatefulWidget {
  const TopikTestResult({super.key});

  @override
  State<TopikTestResult> createState() => _TopikTestResultState();
}

class _TopikTestResultState extends State<TopikTestResult> {
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
              'TOPIK TEST 01',
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
                    width: 130.w,
                    height: 35.h,
                    text: 'RESULT',
                    textColor: textYellowColor,
                    onTap: () {}),
                40.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  height: .3.sh,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, // number of items in each row
                      mainAxisSpacing: 20.0, // spacing between rows
                      crossAxisSpacing: 3.0, // spacing between columns
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // padding around the grid
                    itemCount: 10, // total number of items
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 15.r,
                            backgroundColor:
                                (index <= 4 ? index.isEven : index.isOdd)
                                    ? buttonBlackColor
                                    : textPinkColor,
                            child: Text(
                              'Q${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textWhiteColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            (index <= 4 ? index.isEven : index.isOdd)
                                ? 'O'
                                : 'X',
                            style: TextStyle(
                              color: (index <= 4 ? index.isEven : index.isOdd)
                                  ? textBlackColor
                                  : textPinkColor,
                              fontSize: 16.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
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
                50.verticalSpace,
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
                70.verticalSpace,
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
                      width: 130.w,
                      height: 35.h,
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
                      },
                      textColor: textWhiteColor,
                      width: 130.w,
                      height: 35.h,
                      text: 'Next Test →',
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
