import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/thinking_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/model/thinking.dart';

class TimelineView extends StatelessWidget {
  final bool isEnglish = Get.locale == const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgWhiteColor,
        appBar: isEnglish
            ? AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: bgWhiteColor,
                leading: Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Container(
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(Assets.backArrow))),
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  width: 100.w,
                                  height: 26.h,
                                  decoration: null,
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                    ],
                  ),
                ),
                actions: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.h, right: 15.w),
                      child: Column(
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
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ])
            : AppBar(
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(Assets.notification)),
                elevation: 0,
                scrolledUnderElevation: 0,
                title: Row(
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
                        color: textBlackColor,
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
                centerTitle: true,
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.writetimeline);
            },
            child: CircleAvatar(
              backgroundColor: buttonBlueColor,
              radius: 35.r,
              child: Icon(
                Icons.add,
                size: 35.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<ThinkingController>(builder: (thinkingController) {
          return Padding(
            padding:
                EdgeInsets.only(top: isEnglish ? 15.0 : 5, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Container(
                color: bgWhiteColor,
                child: Column(
                  children: [
                    Text(
                      'What’s On My Time Line'.tr,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 16.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: thinkingController.thinkings.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Thinking thinking =
                                thinkingController.thinkings[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.postView);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Container(
                                  height: .485.sh,
                                  width: .9.sw,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 4,
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
                                            horizontal: 14.w, vertical: 8.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 15.r,
                                                    backgroundImage:
                                                        Image.network(thinking
                                                                .userImage)
                                                            .image),
                                                10.horizontalSpace,
                                                Text(
                                                  thinking.userName,
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
                                                thinking.verified
                                                    ? Image.asset(
                                                        Assets.verified,
                                                        scale: .9.sp,
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 30.sp,
                                              color: textGreyColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: .3.sh,
                                        width: .9.sw,
                                        child: Image.network(
                                          thinking.files[0],
                                          scale: .5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      10.verticalSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          thinking.content,
                                          style: TextStyle(
                                            color: textBlackColor,
                                            fontSize: 10.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      20.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                'Like'.tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: textBlackColor,
                                                  fontSize: 11.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              )
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
                                                'Comment'.tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: textBlackColor,
                                                  fontSize: 11.sp,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
    ;
  }
}
