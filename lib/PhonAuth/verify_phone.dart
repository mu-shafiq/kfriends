import 'package:country_code_picker/country_code_picker.dart';
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

class VerifyPhon extends StatelessWidget {
  const VerifyPhon({super.key});

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
                      Image.asset(
                        Assets.drop,
                        scale: 1.sp,
                      )
                    ],
                  ),
                ),
                10.horizontalSpace,
                CustomTextfield(
                    height: 40.h,
                    width: .685.sw,
                    controller: TextEditingController()),
              ],
            ),
            20.verticalSpace,
            Text(
              '인증번호 확인',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 14.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            20.verticalSpace,
            CustomTextfield(
                height: 40.h,
                width: .934.sw,
                hint: '인증번호를 입력하세요',
                hintSize: 10.sp,
                controller: TextEditingController()),
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
                            content: Container(
                                height: .25.sh,
                                width: .98.sw,
                                color: bgWhiteColor,
                                child: Center(
                                    child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(Assets.alert),
                                        Image.asset(Assets.exclamation),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        '인증번호가 유호하지 않습니다.  다시 확인 후 입력해 주세요.',
                                        style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textBlackColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Center(
                                      child: RoundedButton(
                                        onTap: () {
                                          Get.offAndToNamed(
                                              Routes.bottomNavBar);
                                        },
                                        textColor: textWhiteColor,
                                        shadow1: buttonBlackShadow1,
                                        shadow2: buttonBlackShadow2,
                                        bgColor: buttonBlueColor2,
                                        width: 160.w,
                                        height: 40.h,
                                        text: 'Ok',
                                      ),
                                    ),
                                    10.verticalSpace
                                  ],
                                ))),
                          );
                        });

                    ///mm
                  }),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
