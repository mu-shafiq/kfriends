import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kfriends/CommunityScreens/edit_post.dart';
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

class PostView extends StatelessWidget {
  PostView({super.key});
  final bool isEnglish = Get.locale == const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(index: 0),
        appBar: !isEnglish
            ? AppBar(
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
              )
            : null,
        body: GetBuilder<PostController>(builder: (postController) {
          Post post = postController.posts[postController.selectedPostIndex];
          print(post.likes);
          print(currentUser!.id);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
            child: Column(
              children: [
                isEnglish ? 10.verticalSpace : 0.verticalSpace,
                isEnglish
                    ? Row(
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
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        gradient: const LinearGradient(
                                            end: Alignment.center,
                                            begin: Alignment.topCenter,
                                            colors: [
                                              Color.fromARGB(
                                                  255, 235, 226, 226),
                                              Color.fromARGB(
                                                  255, 231, 227, 227),
                                              Color.fromARGB(
                                                  255, 231, 227, 227),
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
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      )
                    : const SizedBox(),
                isEnglish ? 30.verticalSpace : 0.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 80.w,
                      height: 25.h,
                      text: post.interest.first,
                      selected: true,
                    ),
                  ),
                ),
                15.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      post.title,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 12.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(right: 0.w),
                  child: Container(
                    height: .65.sh,
                    width: .9.sw,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 10.r,
                                      backgroundImage:
                                          Image.network(post.userImage).image),
                                  5.horizontalSpace,
                                  Text(
                                    post.userName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontSize: 9.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    DateFormat('yyyy.MM.dd').format(
                                        DateTime.parse(post.updatedAt!)
                                            .toUtc()),
                                    style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: 8.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                              post.userId == currentUser!.id
                                  ? Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible:
                                                    false, // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Deleting Post?'),
                                                    content:
                                                        const SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              'You will no longer be able to see this post.'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: const Text(
                                                            'Cancel'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                            'Delete'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          postController
                                                              .deleteAPosts();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Image.asset(Assets.delete)),
                                        20.horizontalSpace,
                                        GestureDetector(
                                            onTap: () async {
                                              await postController.enableEdit();
                                              Get.to(EditPost());
                                            },
                                            child: Image.asset(Assets.edit)),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        post.files.isNotEmpty
                            ? Container(
                                height: .4.sh,
                                width: .9.sw,
                                child: Image.network(
                                  post.files[0],
                                  scale: .5,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const SizedBox(),
                        10.verticalSpace,
                        SizedBox(
                          height: .13.sh,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              post.content,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.more,
                                    scale: 1.5.sp,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'Back to List'.tr,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontSize: 10.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.15,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (!post.likes!
                                              .contains(currentUser!.id)) {
                                            postController.addALike();
                                          } else {
                                            postController.removeALike();
                                          }
                                        },
                                        child: post.likes!
                                                .contains(currentUser!.id)
                                            ? Icon(
                                                CupertinoIcons.heart_fill,
                                                size: 15.sp,
                                              )
                                            : Image.asset(
                                                Assets.like,
                                                scale: .8.sp,
                                              ),
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        post.likes!.length.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textBlackColor,
                                          fontSize: 11.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      10.horizontalSpace
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.comment,
                                        scale: .8.sp,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        '0',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textBlackColor,
                                          fontSize: 11.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
    ;
  }
}
