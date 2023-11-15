import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';

class TopikTestSheet extends StatefulWidget {
  const TopikTestSheet({super.key});

  @override
  State<TopikTestSheet> createState() => _TopikTestSheetState();
}

class _TopikTestSheetState extends State<TopikTestSheet> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '1 / 10',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Q. 다음 중 종류가 아닌 것은?',
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 16.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          10.horizontalSpace,
                          Checkbox(
                              side: const BorderSide(
                                  width: 2, color: Color(0xffD9D9D9)),
                              checkColor: buttonBlueColor2,
                              activeColor: buttonBlueColor2,
                              value: selected == 0,
                              onChanged: (v) {
                                setState(() {
                                  selected = 0;
                                });
                              }),
                          Text(
                            '숟가락',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          10.horizontalSpace,
                          Checkbox(
                              side: const BorderSide(
                                  width: 2, color: Color(0xffD9D9D9)),
                              checkColor: buttonBlueColor2,
                              activeColor: buttonBlueColor2,
                              value: selected == 1,
                              onChanged: (v) {
                                setState(() {
                                  selected = 1;
                                });
                              }),
                          Text(
                            '숟가락',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          10.horizontalSpace,
                          Checkbox(
                              side: const BorderSide(
                                  width: 2, color: Color(0xffD9D9D9)),
                              checkColor: buttonBlueColor2,
                              activeColor: buttonBlueColor2,
                              value: selected == 2,
                              onChanged: (v) {
                                setState(() {
                                  selected = 2;
                                });
                              }),
                          Text(
                            '숟가락',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          10.horizontalSpace,
                          Checkbox(
                              side: const BorderSide(
                                  width: 2, color: Color(0xffD9D9D9)),
                              checkColor: buttonBlueColor2,
                              activeColor: buttonBlueColor2,
                              value: selected == 3,
                              onChanged: (v) {
                                if (v!) {
                                  setState(() {
                                    selected = 3;
                                  });
                                }
                              }),
                          Text(
                            '숟가락',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 12.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                .3.sh.verticalSpace,
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
                      text: '← BACK',
                    ),
                    50.horizontalSpace,
                    RoundedSmallButton(
                      selected: true,
                      selectedColor: buttonBlueColor2,
                      onTap: () {
                        Get.toNamed(Routes.topikTestResult);
                      },
                      textColor: textWhiteColor,
                      width: 130.w,
                      height: 35.h,
                      text: 'Next →',
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
