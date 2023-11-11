import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/notice_tile.dart';
import 'package:kfriends/Widgets/textfield.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 4),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset(Assets.backArrow)),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'APP SETTING',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textBlackColor,
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.appLogo2,
                  scale: 15.sp,
                ),
                Text(
                  'K-FRIENDS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textGreyColor,
                    fontSize: 8.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chat Push',
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
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
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 23.h,
                        decoration: selected == 0
                            ? ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                gradient: const LinearGradient(
                                    end: Alignment.centerRight,
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 243, 240, 240)
                                    ]),
                              )
                            : null,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 0;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ON ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selected == 0
                                      ? textPinkColor
                                      : textGreyColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: Container(
                          width: 50.w,
                          height: 23.h,
                          decoration: selected == 1
                              ? ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  gradient: const LinearGradient(
                                      end: Alignment.centerRight,
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 231, 227, 227),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 243, 240, 240)
                                      ]),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              'OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selected == 1
                                    ? textPinkColor
                                    : textGreyColor,
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
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notice Push',
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
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
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 23.h,
                        decoration: selected == 0
                            ? ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                gradient: const LinearGradient(
                                    end: Alignment.centerRight,
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 243, 240, 240)
                                    ]),
                              )
                            : null,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 0;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ON ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selected == 0
                                      ? textPinkColor
                                      : textGreyColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: Container(
                          width: 50.w,
                          height: 23.h,
                          decoration: selected == 1
                              ? ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  gradient: const LinearGradient(
                                      end: Alignment.centerRight,
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 231, 227, 227),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 235, 226, 226),
                                        Color.fromARGB(255, 243, 240, 240)
                                      ]),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              'OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selected == 1
                                    ? textPinkColor
                                    : textGreyColor,
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
              ],
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.terms);
              },
              child: Text(
                'Use & Terms',
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 10.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              'Delete Account',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 10.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
