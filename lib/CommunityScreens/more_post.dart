import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class MorePosts extends StatelessWidget {
  const MorePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(index: 0),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.addPosts);
            },
            child: CircleAvatar(
              backgroundColor: buttonBlueColor,
              radius: 25.r,
              child: Icon(
                Icons.add,
                size: 35.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
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
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(Assets.backArrow))),
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
              20.verticalSpace,
              CustomTextfield(
                  hint: 'Enter your keyword 👀',
                  trailing: Image.asset(Assets.search),
                  hintSize: 10.sp,
                  height: 35.h,
                  width: .9.sw,
                  controller: TextEditingController()),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HOT TOPICS🔥',
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textBlackColor,
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedSmallButton2(
                    onTap: () {},
                    textColor: textBlackColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    bgColor: buttonWhiteColor,
                    width: 80.w,
                    height: 25.h,
                    text: '#K-CULTURE',
                    selected: true,
                  ),
                  RoundedSmallButton2(
                    onTap: () {},
                    textColor: textBlackColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    bgColor: buttonWhiteColor,
                    width: 80.w,
                    height: 25.h,
                    text: '#K-POP',
                  ),
                  RoundedSmallButton2(
                    onTap: () {},
                    textColor: textBlackColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    bgColor: buttonWhiteColor,
                    width: 80.w,
                    height: 25.h,
                    text: '#K-DRAMA',
                  ),
                  RoundedSmallButton2(
                    onTap: () {},
                    textColor: textBlackColor,
                    shadow1: buttonBlackShadow1,
                    shadow2: buttonBlackShadow2,
                    bgColor: buttonWhiteColor,
                    width: 80.w,
                    height: 25.h,
                    text: '#K-FOOD',
                  ),
                ],
              ),
              20.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: PostTile(
                            postCount: 33,
                            postTitle: 'My First visit to Gyeongbokgung! ',
                            postAssets: Image.asset(Assets.postImage),
                            username: '김민준',
                            userAsset: Image.asset(Assets.user1),
                            showBorder: true,
                            date: '2023.06.16'),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
