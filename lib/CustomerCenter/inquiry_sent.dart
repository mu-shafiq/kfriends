import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/small_button.dart';

class INquirySent extends StatelessWidget {
  const INquirySent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomBar(index: 4),
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
            'CUSTOMER CENTER'.tr,
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
                'Your inquiry has been successfully sent!'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: .65.sw,
                child: Text(
                  'We’ll check it and  take appropriate action.We’re trying to respond back as soon as possible.Thank you!  '
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
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
    ;
  }
}
