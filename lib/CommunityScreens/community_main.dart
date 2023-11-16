import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({super.key});

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> {
  int crouselindex = 0;

  List interests = [
    '#K-CULTURE',
    '#K-POP',
    '#K-DRAMA',
    '#K-FOOD',
    '#K-DRAMA',
    '#K-FOOD'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [
          20.verticalSpace,
          CustomTextfield(
              ontap: () {
                Get.toNamed(Routes.searchTimeline);
              },
              hint: 'Enter your keyword 👀',
              trailing: Image.asset(Assets.search),
              hintSize: 11.sp,
              height: 40.h,
              width: .9.sw,
              controller: TextEditingController()),
          27.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'HOT TOPICS🔥',
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: textBlackColor,
                  height: 17 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          10.verticalSpace,
          SizedBox(
            height: 33.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    child: Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 15 : 0),
                      child: RoundedSmallButton2(
                        onTap: () {},
                        textColor: textBlackColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        bgColor: buttonWhiteColor,
                        width: 85.w,
                        height: 22.h,
                        text: interests[index],
                        selected: index == 0,
                      ),
                    ),
                  );
                }),
          ),
          15.verticalSpace,
          Container(
            height: .42.sh,
            width: .9.sw,
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
            child: Column(
              children: [
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.postView);
                        },
                        child: PostTile(
                            postTitle: 'My First visit to Gyeongbokgung! ',
                            postAssets: Image.asset(Assets.postImage),
                            username: '김민준',
                            userAsset: Image.asset(Assets.user1),
                            showBorder: false,
                            date: '2023.06.16'),
                      );
                    }),
                15.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.morePost);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'more',
                        style: TextStyle(
                          color: textGreyColor,
                          fontSize: 10.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      3.horizontalSpace,
                      Image.asset(
                        Assets.arrowForward,
                        scale: 1,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          28.verticalSpace,
          SizedBox(
            width: .9.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'What Are You Thinking Now?',
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 16.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.timlineView);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'more',
                        style: TextStyle(
                          color: textGreyColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      3.horizontalSpace,
                      Image.asset(
                        Assets.arrowForward,
                        scale: .8,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          20.verticalSpace,
          SizedBox(
            width: 1.sw,
            height: .49.sh,
            child: CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  height: .63.sh,
                  aspectRatio: .5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  reverse: false,
                  autoPlay: true,
                  disableCenter: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      crouselindex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.postView);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 0.w),
                      child: Container(
                        height: .485.sh,
                        width: .9.sw,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 20.r,
                                          child: Image.asset(Assets.user1)),
                                      10.horizontalSpace,
                                      Text(
                                        '주희',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textBlackColor,
                                          fontSize: 11.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      Image.asset(
                                        Assets.verified,
                                        scale: .6.sp,
                                      )
                                    ],
                                  ),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30.sp,
                                    color: textGreyColor,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: .3.sh,
                              width: .9.sw,
                              child: Image.asset(
                                Assets.postimage2,
                                scale: .5,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'This is my favorite Cafe☕ Do you guys like coffee? If you dont, it’s OK~~',
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.like,
                                      scale: .6.sp,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'Like',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textBlackColor,
                                        fontSize: 11.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.comment,
                                      scale: .7.sp,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'Comment',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textBlackColor,
                                        fontSize: 11.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          10.verticalSpace,
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: crouselindex == i
                          ? buttonBlueColor2
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }),
          ),
          30.verticalSpace
        ],
      ),
    );
  }
}
