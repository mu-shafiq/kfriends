import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kfriends/Controllers/post_controller.dart';
import 'package:kfriends/Controllers/thinking_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/post_tile.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/model/post.dart';
import 'package:kfriends/model/thinking.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({super.key});

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> {
  int crouselindex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (postController) {
      return GetBuilder<ThinkingController>(builder: (thinkingController) {
        return SizedBox(
          width: 1.sw,
          child: Column(
            children: [
              CustomTextfield(
                  ontap: () {
                    Get.toNamed(Routes.searchTimeline);
                  },
                  hint: 'Enter your keyword 👀'.tr,
                  trailing: Image.asset(Assets.search),
                  hintSize: 11.sp,
                  height: 40.h,
                  width: .92.sw,
                  controller: TextEditingController()),
              27.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HOT TOPICS🔥'.tr,
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
              postController.posts.where((element) => element.interest
                          .contains(postController.selectedInterest)) !=
                      0
                  ? Container(
                      width: .92.sw,
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
                              itemCount: postController.posts.length > 3
                                  ? 3
                                  : postController.posts.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                print(postController.posts.length);
                                Post post = postController.posts[index];
                                return post.interest.contains(
                                        postController.selectedInterest)
                                    ? GestureDetector(
                                        onTap: () {
                                          postController.updateIndex(index);
                                          Get.toNamed(Routes.postView);
                                        },
                                        child: PostTile(
                                            postTitle: post.title,
                                            postAssets:
                                                Image.network(post.files[0]),
                                            username: post.userName,
                                            userAsset:
                                                Image.network(post.userImage),
                                            showBorder: false,
                                            date: DateFormat('yyyy.MM.dd')
                                                .format(DateTime.parse(
                                                        post.updatedAt!)
                                                    .toUtc())),
                                      )
                                    : const SizedBox();
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
                          ),
                          5.verticalSpace
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.addPost);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 17.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'No posts related this tag',
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 11.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            50.horizontalSpace,
                            Icon(
                              Icons.add,
                              size: 11.sp,
                            ),
                            3.horizontalSpace,
                            Text(
                              'add new post',
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 11.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              28.verticalSpace,
              SizedBox(
                width: .92.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What Are You Thinking Now?'.tr,
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
              thinkingController.thinkings.isNotEmpty
                  ? SizedBox(
                      width: 1.sw,
                      // height: .49.sh,
                      child: CarouselSlider.builder(
                          itemCount: thinkingController.thinkings.length,
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
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            print(crouselindex);
                            Thinking thinking =
                                thinkingController.thinkings[itemIndex];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.postView);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0.w),
                                child: Container(
                                  // height: .485.sh,
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
                                            horizontal: 18.w, vertical: 10.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20.r,
                                                  backgroundImage:
                                                      Image.network(
                                                    thinking.userImage,
                                                    fit: BoxFit.fill,
                                                  ).image,
                                                ),
                                                10.horizontalSpace,
                                                Text(
                                                  thinking.userName,
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
                                        height: .335.sh,
                                        width: .9.sw,
                                        child: Image.network(
                                          thinking.files[0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      10.verticalSpace,
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 19.0.w),
                                        child: Text(
                                          thinking.content,
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                'Like'.tr,
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
                                                'Comment'.tr,
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
                    )
                  : Center(
                      child: Text(
                        'Timeline is empty',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
              10.verticalSpace,
              thinkingController.thinkings.isNotEmpty
                  ? SizedBox(
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
                    )
                  : const SizedBox(),
              30.verticalSpace
            ],
          ),
        );
      });
    });
  }
}
