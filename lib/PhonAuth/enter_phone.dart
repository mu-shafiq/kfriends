import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class EnterPhonNumber extends StatelessWidget {
  const EnterPhonNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
        title: Text(
          '휴대폰 인증',
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
      bottomNavigationBar: const BottomBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '휴대폰 번호',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 14.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 221, 221),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'KR',
                        favorite: const ['+39', 'FR'],
                        padding: EdgeInsets.zero,
                        flagWidth: 15.w,
                        textStyle: TextStyle(
                          color: textBlackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0.15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Image.asset(
                          Assets.drop,
                          scale: 1.sp,
                        ),
                      )
                    ],
                  ),
                ),
                10.horizontalSpace,
                CustomTextfield(
                    height: 40.h,
                    width: .685.sw,
                    hint: '',
                    controller: TextEditingController()),
              ],
            ),
            33.verticalSpace,
            Container(
              alignment: Alignment.center,
              child: RoundedButton(
                  height: 35.h,
                  width: 130.w,
                  text: '인증번호 전송',
                  bgColor: buttonBlueColor2,
                  shadow1: buttonBlackShadow1,
                  shadow2: buttonBlackShadow2,
                  textColor: textWhiteColor,
                  onTap: () {
                    Get.toNamed(Routes.verifyPhon);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
