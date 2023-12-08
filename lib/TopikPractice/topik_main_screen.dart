import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/topik_test_tile.dart';

class TopikMainScreen extends StatelessWidget {
  const TopikMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(Assets.backArrow))),
          title: Container(
            width: 210.w,
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
                  Container(
                    width: 100.w,
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
                              color: textPinkColor,
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
                              height: -.3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(const BottomNavBar(
                        initialIndex: 0,
                        homeIndex: 1,
                      ));
                    },
                    child: Container(
                      width: 100.w,
                      height: 26.h,
                      decoration: null,
                      child: Center(
                        child: Text(
                          'COMMUNITY 🌏',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFC9C9C9),
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 15),
              child: Column(
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
              ),
            )
          ],
        ),
        bottomNavigationBar: const BottomBar(index: 0),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: bgWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: .92.sw,
                        child: Image.asset(
                          Assets.topikpractice,
                          scale: .0007,
                          fit: BoxFit.cover,
                        ),
                      )),
                  26.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PRACTICE LIST",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: textBlackColor,
                          height: 17 / 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  SizedBox(
                    width: .9.sw,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TopikTestTile(
                              testName: 'TOPIK TEST 0${index + 1}',
                              words: 10,
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
