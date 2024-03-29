import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class CommentTile extends StatelessWidget {
  final String asset;
  final String username;
  final String comment;
  final bool verified;
  final String time;

  const CommentTile(
      {super.key,
      required this.asset,
      required this.username,
      required this.comment,
      required this.verified,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: .9.sw,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
              Stack(
                children: [
                  ListTile(
                    horizontalTitleGap: 5.w,
                    contentPadding: EdgeInsets.only(left: 5.w, top: 5.h),
                    leading: CircleAvatar(
                      radius: 35.r,
                      backgroundImage: Image.asset(
                        asset,
                      ).image,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              username,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textBlackColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            3.horizontalSpace,
                            verified
                                ? Image.asset(Assets.verified)
                                : const SizedBox(),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 110.w,
                              height: 30.h,
                              child: Text(
                                comment,
                                maxLines: 3,
                                style: TextStyle(
                                    color: textBlackColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15.w,
                    top: 15.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            color: textGreyColor,
                            fontSize: 8.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          width: 90.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              6.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0.sp),
                                    child: Text(
                                      'Reply'.tr,
                                      style: TextStyle(
                                          color: textBlackColor,
                                          fontSize: 10.sp,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: -.2.h),
                                    ),
                                  ),
                                  Text(
                                    ' | ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: textBlackColor,
                                      fontSize: 12.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0.sp),
                                    child: Text(
                                      '  Delete'.tr,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: textBlackColor,
                                        fontSize: 10.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: .7.sw,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: reply(index.isEven ? true : false, username,
                                comment, time),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget reply(bool isme, String username, String comment, String time) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: .9.sw,
          height: 77.h,
          child: Stack(
            children: [
              ListTile(
                horizontalTitleGap: 5.w,
                contentPadding: EdgeInsets.only(left: 5.w),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isme ? Image.asset(Assets.reply) : const SizedBox(),
                        Text(
                          isme ? 'My Reply'.tr : username,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        3.horizontalSpace,
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 110.w,
                      height: 30.h,
                      child: Text(
                        comment,
                        maxLines: 3,
                        style: TextStyle(
                            color: textBlackColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 15.w,
                top: 12.h,
                bottom: 5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 8.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          6.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0.sp),
                                  child: Text(
                                    'Reply'.tr,
                                    style: TextStyle(
                                        color: textBlackColor,
                                        fontSize: 10.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: -.3.h),
                                  ),
                                ),
                              ),
                              Text(
                                ' | ',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: textBlackColor,
                                  fontSize: 12.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 10.0.sp),
                                child: Text(
                                  '  Delete'.tr,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: textBlackColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
