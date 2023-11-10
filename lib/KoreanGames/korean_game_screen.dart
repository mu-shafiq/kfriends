import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';

class KoreanGameScreen extends StatelessWidget {
  const KoreanGameScreen({super.key});

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
        body: Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color(0xffFFFFFF),
                  Color(0xffE2FFFA),
                  Color(0xff55E2AF)
                ])),
            child: Padding(
              padding: EdgeInsets.all(15.0.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  10.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi, ',
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Betty\n',
                              style: TextStyle(
                                color: textBlueColor,
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Are you ready?',
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 16.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      70.verticalSpace,
                      Text(
                        'INSTRUCTION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      15.verticalSpace,
                      Text(
                        'Drag the picture and place it over the matching word',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.15,
                        ),
                      ),
                      80.verticalSpace,
                      RoundedButton(
                          bgColor: buttonBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          height: 35.h,
                          width: 120.w,
                          text: 'START',
                          textColor: textYellowColor,
                          onTap: () {
                            Get.toNamed(Routes.koreanGameSheet);
                          })
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
