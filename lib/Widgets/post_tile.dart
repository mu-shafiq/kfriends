import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class PostTile extends StatelessWidget {
  final String postTitle;
  final Widget postAssets;
  final String username;
  final Widget userAsset;
  final String date;
  final bool showBorder;
  final int? postCount;
  const PostTile(
      {super.key,
      required this.postTitle,
      required this.postAssets,
      required this.username,
      required this.userAsset,
      required this.date,
      required this.showBorder,
      this.postCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: postCount == null ? 100.h : 90.h,
      width: .9.sw,
      decoration: showBorder
          ? ShapeDecoration(
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
            )
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      postTitle,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 12.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    10.horizontalSpace,
                    postCount != null
                        ? CircleAvatar(
                            backgroundColor: buttonGreenColor2,
                            radius: 10.r,
                            child: Text(
                              postCount.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.15,
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                7.verticalSpace,
                Row(
                  children: [
                    CircleAvatar(radius: 15.r, child: userAsset),
                    5.horizontalSpace,
                    Text(
                      username,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 9.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    10.horizontalSpace,
                    Container(
                      width: 1,
                      height: 10,
                      decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                    ),
                    10.horizontalSpace,
                    Text(
                      date,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 8.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
                height: postCount == null ? 75.h : 55.h,
                width: postCount == null ? 75.w : 55.w,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.asset(
                  Assets.postImage,
                  scale: .5,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}
