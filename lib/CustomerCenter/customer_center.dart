import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class CustomerCenter extends StatelessWidget {
  const CustomerCenter({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              10.verticalSpace,
              CustomTextfield(
                controller: TextEditingController(),
                width: .93.sw,
                height: 40.h,
                hintSize: 10.sp,
                hint: 'CATEGORY'.tr,
                hintColor: textBlackColor,
                trailing: Image.asset(Assets.drop),
              ),
              10.verticalSpace,
              CustomTextfield(
                controller: TextEditingController(),
                width: .93.sw,
                height: 40.h,
                hintSize: 10.sp,
                hint: 'Title'.tr,
              ),
              10.verticalSpace,
              CustomTextfield(
                controller: TextEditingController(),
                width: .93.sw,
                height: 340.h,
                hintSize: 10.sp,
                hint: 'Enter your Content...'.tr,
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSmallButton(
                    selected: true,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(3),
                            backgroundColor: bgWhiteColor,
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            content: SizedBox(
                                height: .15.sh,
                                width: .98.sw,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'You must fill the title and the content !',
                                    style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: textBlackColor,
                                      height: 15 / 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ))),
                            actions: [
                              Center(
                                child: RoundedButton(
                                  onTap: () {
                                    Get.back();
                                    Get.toNamed(Routes.inquirySent);
                                  },
                                  textColor: textWhiteColor,
                                  shadow1: buttonBlackShadow1,
                                  shadow2: buttonBlackShadow2,
                                  bgColor: buttonBlueColor2,
                                  width: 170.w,
                                  height: 35.h,
                                  text: 'Ok',
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    textColor: textWhiteColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    selectedColor: buttonBlueColor2,
                    width: 160.w,
                    height: 35.h,
                    text: 'SEND',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
