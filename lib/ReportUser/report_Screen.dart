import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 1),
      backgroundColor: bgWhiteColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
        title: Text(
          'USER REPORT'.tr,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.all(14.r),
              child: Row(
                children: [
                  Text(
                    "User Name".tr,
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textBlackColor,
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            CustomTextfield(
              controller: TextEditingController(),
              width: .93.sw,
              height: 40.h,
              hintSize: 10.sp,
              hint: 'Alex',
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.all(14.r),
              child: Row(
                children: [
                  Text(
                    "Report Type".tr,
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textBlackColor,
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            CustomTextfield(
              controller: TextEditingController(),
              width: .93.sw,
              height: 40.h,
              hintSize: 10.sp,
              hint: 'Select Report Type'.tr,
              trailing: Image.asset(Assets.drop),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.all(14.r),
              child: Row(
                children: [
                  Text(
                    "Report Content".tr,
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textBlackColor,
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            CustomTextfield(
              controller: TextEditingController(),
              width: .93.sw,
              height: 340.h,
              hintSize: 10.sp,
              hint: 'Please describe what you want to report about this use..'.tr,
            ),
            20.verticalSpace,
            SizedBox(
              width: .93.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedSmallButton(
                    selected: true,
                    onTap: () {
                      Get.toNamed(Routes.reportSent);
                    },
                    textColor: textWhiteColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    selectedColor: buttonBlueColor2,
                    width: 170.w,
                    height: 35.h,
                    text: 'Send Report'.tr,
                  ),
                  RoundedSmallButton(
                    onTap: () {
                      Get.back();
                    },
                    textColor: textBlackColor,
                    width: 170.w,
                    height: 35.h,
                    text: 'Cancel'.tr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
