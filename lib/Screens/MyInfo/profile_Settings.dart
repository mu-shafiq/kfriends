import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
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
            'SETTING'.tr,
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
              Text(
                'My Profile'.tr,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              10.verticalSpace,
              InkWell(
                onTap: () {
                  log('message');
                  Get.toNamed(Routes.editProfile);
                },
                child: Container(
                  width: .92.sw,
                  height: 68.h,
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
                  child: Center(
                    child: GestureDetector(
                      child: ListTile(
                        horizontalTitleGap: 5,
                        contentPadding: EdgeInsets.only(
                            bottom: 5.h, left: 10.w, right: 10.w),
                        leading: CircleAvatar(
                          radius: 30.r,
                          backgroundImage:
                              Image.network(controller.userModel!.profileImage)
                                  .image,
                        ),
                        title: Text(
                          controller.userModel!.username,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        subtitle: SizedBox(
                          width: 171,
                          child: Text(
                            '${controller.userModel!.age} / ${controller.userModel!.gender.toUpperCase().tr} / ${controller.userModel!.country}',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                            ),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Edit →'.tr,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFFA0A0A0),
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 170.w,
                    height: 31.h,
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Remain Call Time'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textBlueColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 2,
                            ),
                          ),
                          10.horizontalSpace,
                          Text(
                            '25:27',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textBlueColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.buyPackage);
                    },
                    child: Container(
                      width: 165.w,
                      height: 31.h,
                      decoration: ShapeDecoration(
                        color: buttonBlueColor2,
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
                      child: Center(
                        child: Text(
                          'Buy Call Package'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              35.verticalSpace,
              Text(
                'Setting'.tr,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              20.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.notice);
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notice'.tr,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.paymentList);
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment List'.tr,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.to(const BottomNavBar(initialIndex: 3));
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Call History'.tr,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.appSettings);
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'App Setting'.tr,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.customerCenter);
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Customer Center'.tr,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          '→',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () async {
                  const storage = FlutterSecureStorage();
                  await storage.deleteAll();
                  Get.offAllNamed(Routes.loginScreen);
                },
                child: Container(
                  width: .92.sw,
                  height: 46.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout'.tr,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
