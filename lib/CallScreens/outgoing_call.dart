import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class OutgoingCall extends StatefulWidget {
  const OutgoingCall({super.key});

  @override
  State<OutgoingCall> createState() => _OutgoingCallState();
}

class _OutgoingCallState extends State<OutgoingCall> {
  bool mute = false;
  bool record = true;
  bool speaker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const SizedBox(),
          title: Text(
            'CALL'.tr,
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
                children: [
                  Image.asset(
                    Assets.appLogo2,
                    scale: 15.sp,
                  ),
                  2.horizontalSpace,
                  Text(
                    'K-FRIENDS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textGreyColor,
                      fontSize: 7.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffFFFFFF),
                      Color(0xffE2F8FF),
                      Color(0xffAFCFFF)
                    ])),
                width: 1.sw,
                height: .5.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 65.r,
                          child: Image.asset(
                            Assets.user1,
                            scale: .5,
                          ),
                        ),
                        Text(
                          '윤지',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 24.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        50.verticalSpace,
                        Image.asset(
                          Assets.outgoing,
                          color: textBlackColor,
                          scale: 1,
                        ),
                        30.verticalSpace,
                        Text(
                          'Waiting for Haley to pick up the phone...'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textGreyColor,
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: .37.sh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: .8.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  speaker = !speaker;
                                });
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: speaker ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
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
                                child: Image.asset(
                                  Assets.speaker,
                                  color: speaker ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Speaker'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  mute = !mute;
                                });
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: mute ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
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
                                child: Image.asset(
                                  Assets.mic,
                                  color: mute ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Mute'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  record = !record;
                                });
                              },
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: ShapeDecoration(
                                  color: record ? boxBlueColor : bgWhiteColor,
                                  shape: const OvalBorder(),
                                  shadows: const [
                                    BoxShadow(
                                      color: buttonBlackShadow1,
                                      blurRadius: 4,
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
                                child: Image.asset(
                                  Assets.record,
                                  color: record ? Colors.white : null,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Record'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  InkWell(
                      onTap: () {
                        Get.back();
                        Get.back();
                      },
                      child: Image.asset(Assets.reject))
                ],
              ),
            )
          ],
        ));
  }
}
