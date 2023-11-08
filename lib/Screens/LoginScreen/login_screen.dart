import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Screens/JoinFormScreen/join_form_screen.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/Icon_button.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

import '../../Routes/get_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: 1.sw,
                height: 1.sh,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: bgWhiteColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    90.verticalSpace,
                    Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: textBlackColor,
                        height: 29 / 24,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    40.verticalSpace,
                    CustomTextfield(
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 35.h,
                      hint: 'E-mail',
                    ),
                    20.verticalSpace,
                    CustomTextfield(
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 35.h,
                      hint: 'Password',
                    ),
                    20.verticalSpace,
                    RoundedButton(
                      onTap: () {
                        Get.toNamed(Routes.joinFormScreen);
                      },
                      textColor: textGreenColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonBlackColor,
                      width: .9.sw,
                      height: 35.h,
                      text: 'Login',
                    ),
                    20.verticalSpace,
                    Text(
                      'Sign in with E-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    2.verticalSpace,
                    Container(
                      width: .25.sw,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                    40.verticalSpace,
                    Text(
                      'Login with Social ID',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    20.verticalSpace,
                    IconRoundedButton(
                      onTap: () {
                        Get.toNamed(Routes.joinFormScreen);
                      },
                      textColor: textWhiteColor,
                      icon: Image.asset(Assets.apple),
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonBlackColor,
                      width: .9.sw,
                      height: 35.h,
                      text: 'Sign in with Apple ID',
                    ),
                    15.verticalSpace,
                    IconRoundedButton(
                      onTap: () {
                        Get.toNamed(Routes.joinFormScreen);
                      },
                      textColor: textWhiteColor,
                      icon: Image.asset(Assets.oneline),
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonGreenColor,
                      width: .9.sw,
                      height: 35.h,
                      text: 'Sign in with Line ID',
                    ),
                    15.verticalSpace,
                    IconRoundedButton(
                      onTap: () {
                        Get.toNamed(Routes.joinFormScreen);
                      },
                      textColor: textWhiteColor,
                      icon: Image.asset(Assets.fb),
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonBlueColor,
                      width: .9.sw,
                      height: 35.h,
                      text: 'Sign in with Facebook ID',
                    ),
                    15.verticalSpace,
                    IconRoundedButton(
                      onTap: () {
                        Get.toNamed(Routes.joinFormScreen);
                      },
                      textColor: textBlackColor,
                      icon: Image.asset(Assets.google),
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: .9.sw,
                      height: 35.h,
                      text: "Sign in with Google ID",
                    )
                  ],
                )),
            Positioned(
              top: 25.h,
              left: 10.w,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  Assets.backArrow,
                  scale: .7.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
