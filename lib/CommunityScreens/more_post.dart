import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kfriends/Controllers/post_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/model/post.dart';

class MorePosts extends StatefulWidget {
  const MorePosts({super.key});

  @override
  State<MorePosts> createState() => _MorePostsState();
}

class _MorePostsState extends State<MorePosts> {
  final bool isEnglish = Get.locale == const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isEnglish
            ? AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: bgWhiteColor,
                leading: Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Container(
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(Assets.backArrow))),
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  width: 100.w,
                                  height: 26.h,
                                  decoration: null,
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                    ],
                  ),
                ),
                actions: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.h, right: 15.w),
                      child: Column(
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
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ])
            : AppBar(
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(Assets.notification)),
                elevation: 0,
                scrolledUnderElevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.appLogo2,
                      scale: 15.sp,
                    ),
                    Text(
                      'K-FRIENDS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, right: 15),
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '49,000 ',
                                style: TextStyle(
                                  color: textYellowColor,
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
                    ),
                  )
                ],
              ),
        bottomNavigationBar: const BottomBar(index: 0),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.addPost);
            },
            child: CircleAvatar(
              backgroundColor: buttonBlueColor,
              radius: 30.r,
              child: Icon(
                Icons.add,
                size: 35.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<PostController>(builder: (postController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                isEnglish ? 20.verticalSpace : 0.verticalSpace,
                CustomTextfield(
                    hint: 'Enter your keyword 👀'.tr,
                    trailing: Image.asset(Assets.search),
                    hintSize: 11.sp,
                    height: 40.h,
                    width: .91.sw,
                    controller: TextEditingController()),
                20.verticalSpace,
                SizedBox(
                  height: 36.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          child: Padding(
                            padding: EdgeInsets.only(left: index == 0 ? 15 : 0),
                            child: RoundedSmallButton2(
                              onTap: () {
                                postController.updateInterest(interests[index]);
                              },
                              textColor: textBlackColor,
                              shadow1: buttonBlackShadow1,
                              shadow2: buttonBlackShadow2,
                              bgColor: buttonWhiteColor,
                              width: 85.w,
                              height: 22.h,
                              text: interests[index],
                              selected: postController.selectedInterest ==
                                  interests[index],
                            ),
                          ),
                        );
                      }),
                ),
                15.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: postController.posts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Post post = postController.posts[index];
                        return GestureDetector(
                          onTap: () {
                            postController.updateIndex(index);
                            Get.toNamed(Routes.postView);
                          },
                          child: post.interest
                                  .contains(postController.selectedInterest)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: PostTile(
                                      postCount: post.likes!.length,
                                      postTitle: post.title,
                                      postAssets: Image.network(post.files[0]),
                                      username: post.userName,
                                      userAsset: Image.network(post.userImage),
                                      showBorder: true,
                                      more: true,
                                      date: DateFormat('yyyy.MM.dd').format(
                                          DateTime.parse(post.updatedAt!)
                                              .toUtc())),
                                )
                              : const SizedBox(),
                        );
                      }),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
