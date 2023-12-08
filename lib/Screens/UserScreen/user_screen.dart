import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 1.sw,
          height: 1.sh,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: bgWhiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  width: .8.sw,
                  height: .35.sh,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color:
                              selected == 0 ? borderBlueColor : bgWhiteColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Global User',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 22.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            ' 🌏',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 16.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Text(
                        'Do you want to study Korean and\nmake Korean friends?\nThen, join us now as a global user!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 14.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      15.verticalSpace,
                      RoundedButton(
                        onTap: () async {
                          if (selected == 0) {
                            Get.updateLocale(const Locale('en', 'US'));
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                                Keys.locale, Keys.english);
                            Get.toNamed(Routes.loginScreen);
                          }
                        },
                        textColor: textGreenColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonBlackColor,
                        width: 110.w,
                        height: 30.h,
                        text: 'Go to Login',
                      )
                    ],
                  ),
                ),
              ),
              40.verticalSpace,
              InkWell(
                onTap: () async {
                  setState(() {
                    selected = 1;
                  });
                  Get.updateLocale(const Locale('ko', 'KR'));
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString(Keys.locale, Keys.korean);
                },
                child: Container(
                  width: .8.sw,
                  height: .35.sh,
                  decoration: ShapeDecoration(
                    color: bgWhiteColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color:
                              selected == 1 ? borderBlueColor : bgWhiteColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Korean User',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 22.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            ' 🇰🇷',
                            style: TextStyle(
                              color: textBlackColor,
                              fontSize: 16.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Text(
                        '한국을 사랑하는 전 세계인과 친구가 되고 싶나요?\n그렇다면, 지금 K-Friends에 로그인 해보세요!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      15.verticalSpace,
                      RoundedButton(
                        onTap: () {
                          if (selected == 1) {
                            Get.toNamed(Routes.loginScreen);
                          }
                        },
                        textColor: textYellowColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonBlackColor,
                        width: 110.w,
                        height: 30.h,
                        text: '로그인 하러 가기',
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
