import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Widgets/Icon_button.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

import '../../Routes/get_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                      width: 1.sw,
                      height: 1.sh,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: bgWhiteColor),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            120.verticalSpace,
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
                            43.verticalSpace,
                            CustomTextfield(
                              controller: controller.emailController,
                              width: .9.sw,
                              height: 40.h,
                              hint: 'E-mail',
                              hintSize: 10.sp,
                            ),
                            13.verticalSpace,
                            CustomTextfield(
                              controller: controller.passwordController,
                              width: .9.sw,
                              height: 40.h,
                              hint: 'Password',
                              hintSize: 10.sp,
                            ),
                            16.verticalSpace,
                            RoundedButton(
                              onTap: () {
                                String alertContent = '';
                                if (controller.emailController.text.isEmpty) {
                                  alertContent += 'Please enter your email';
                                }
                                if (!GetUtils.isEmail(
                                        controller.emailController.text) &&
                                    controller
                                        .emailController.text.isNotEmpty) {
                                  alertContent +=
                                      '\nPlease enter a valid email';
                                }
                                if (controller
                                    .passwordController.text.isEmpty) {
                                  alertContent +=
                                      '\nPlease enter your password';
                                }
                                if (alertContent.isNotEmpty) {
                                  Helper().showAlertDialog(alertContent);
                                } else {
                                  controller.login();
                                }
                              },
                              textColor: textGreenColor,
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonBlackColor,
                              width: .9.sw,
                              height: 35.h,
                              text: 'LOGIN',
                            ),
                            20.verticalSpace,
                            Text(
                              'Sign in with E-mail',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              width: .23.sw,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                ),
                              ),
                            ),
                            60.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: .3.sw,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: .1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                    ),
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  'Login with Social ID'.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                3.horizontalSpace,
                                Container(
                                  width: .3.sw,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: .1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            IconRoundedButton(
                              onTap: () {
                                Get.toNamed(Routes.joinFormScreen);
                              },
                              textColor: textWhiteColor,
                              icon: Image.asset(
                                Assets.apple,
                                scale: .5,
                              ),
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonBlackColor,
                              width: .9.sw,
                              height: 35.h,
                              text: 'Sign in with Apple ID'.tr,
                            ),
                            15.verticalSpace,
                            IconRoundedButton(
                              onTap: () {
                                Get.toNamed(Routes.joinFormScreen);
                              },
                              textColor: textWhiteColor,
                              icon: Image.asset(
                                Assets.oneline,
                                scale: .5,
                              ),
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonGreenColor,
                              width: .9.sw,
                              height: 35.h,
                              text: 'Sign in with Line ID'.tr,
                            ),
                            15.verticalSpace,
                            IconRoundedButton(
                              onTap: () {
                                if (controller.emailController.text.isEmpty) {
                                  // toast in korean language
                                  Helper().showToast("이메일을 입력해주세요");
                                } else if (!GetUtils.isEmail(
                                    controller.emailController.text)) {
                                  Helper().showToast("유효한 이메일을 입력해 주세요");
                                } else if (controller
                                    .passwordController.text.isEmpty) {
                                  Helper().showToast("비밀번호를 입력해주세요");
                                } else {
                                  Get.toNamed(Routes.joinFormScreen);
                                }
                              },
                              textColor: textWhiteColor,
                              icon: Image.asset(
                                Assets.fb,
                                scale: .5,
                              ),
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonBlueColor,
                              width: .9.sw,
                              height: 35.h,
                              text: 'Sign in with Facebook ID'.tr,
                            ),
                            15.verticalSpace,
                            IconRoundedButton(
                              onTap: () {
                                Get.toNamed(Routes.joinFormScreen);
                              },
                              textColor: textBlackColor,
                              icon: Image.asset(
                                Assets.google,
                                scale: .5,
                              ),
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonWhiteColor,
                              width: .9.sw,
                              height: 35.h,
                              text: "Sign in with Google ID".tr,
                            )
                          ],
                        ),
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
        });
  }
}
