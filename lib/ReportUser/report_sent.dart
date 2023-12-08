import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class ReportSent extends StatelessWidget {
  const ReportSent({super.key});

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
        body: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.blueTick2),
              5.verticalSpace,
              Text(
                'Your report has been successfully sent!'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              20.verticalSpace,
              Text(
                'Our Monitoring manager will check it and take appropriate action.'.tr,
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
              RoundedSmallButton(
                selected: true,
                onTap: () {
                  Get.back();
                },
                textColor: textWhiteColor,
                shadow1: buttonBlackShadow1,
                shadow2: buttonBlackShadow2,
                selectedColor: buttonBlueColor2,
                width: 160.w,
                height: 35.h,
                text: 'Back'.tr,
              ),
            ],
          ),
        ));
  }
}
