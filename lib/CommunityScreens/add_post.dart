import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/rounded_button.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgWhiteColor,
        bottomNavigationBar: const BottomBar(index: 0),
        body: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 35,
                      width: 35,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: OvalBorder(),
                        shadows: [
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
                      child: Image.asset(Assets.backArrow)),
                  Container(
                    decoration: ShapeDecoration(
                      color: buttonWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: buttonBlackShadow1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: buttonBlackShadow2,
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offAndToNamed(Routes.bottomNavBar);
                            },
                            child: Container(
                              width: 110.w,
                              height: 26.h,
                              decoration: null,
                              child: GestureDetector(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PRACTICE ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 10.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    3.horizontalSpace,
                                    Text(
                                      '✍️',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: textYellowColor,
                                          fontSize: 15.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: -0.5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 110.w,
                              height: 26.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                gradient: const LinearGradient(
                                    end: Alignment.center,
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 235, 226, 226),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 231, 227, 227),
                                      Color.fromARGB(255, 243, 240, 240)
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  'COMMUNITY 🌏',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textBlueColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '49,000 ',
                              style: TextStyle(
                                color: Color(0xFFFFCC00),
                                fontSize: 12.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'P',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 49.w,
                        height: 1,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              30.verticalSpace,
              CustomTextfield(
                  height: 35.h,
                  width: .9.sw,
                  hint: '#K-CULTURE',
                  hintSize: 10.sp,
                  trailing: Image.asset(Assets.drop),
                  controller: TextEditingController()),
              20.verticalSpace,
              CustomTextfield(
                  height: 35.h,
                  width: .9.sw,
                  hint: 'Title',
                  hintSize: 10.sp,
                  controller: TextEditingController()),
              20.verticalSpace,
              CustomTextfield(
                  height: .4.sh,
                  width: .9.sw,
                  hint: 'Enter your Contents...',
                  hintSize: 10.sp,
                  controller: TextEditingController()),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 100.h,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: SizedBox(
                                height: 60.h,
                                width: 60.w,
                                child: Image.asset(
                                  Assets.postImage,
                                  scale: .5.sp,
                                )),
                          );
                        }),
                  ),
                  Container(
                    width: 65.w,
                    height: 65.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 65,
                            height: 65,
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
                            child: Icon(
                              Icons.add,
                              color: const Color.fromARGB(255, 201, 194, 194),
                              size: 40.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RoundedButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            content: SizedBox(
                                height: 80.h,
                                // width: .8.sw,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'alertContent',
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
                                    // Get.offAndToNamed(
                                    //     Routes.bottomNavBar);
                                    Get.back();
                                  },
                                  textColor: textWhiteColor,
                                  shadow1: buttonBlackShadow1,
                                  shadow2: buttonBlackShadow2,
                                  bgColor: buttonBlueColor2,
                                  width: 160.w,
                                  height: 30.h,
                                  text: 'Ok',
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    textColor: textWhiteColor,
                    bgColor: buttonBlueColor2,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    width: 170.w,
                    height: 35.h,
                    text: 'Ok',
                  ),
                  5.horizontalSpace,
                  RoundedSmallButton(
                    onTap: () {
                      Get.back();
                    },
                    textColor: textWhiteColor,
                    width: 170.w,
                    height: 35.h,
                    text: 'Cancel',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
