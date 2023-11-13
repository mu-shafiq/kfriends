import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class CommentTile2 extends StatefulWidget {
  final String asset;
  final String username;
  final String comment;
  final bool verified;
  final String time;

  const CommentTile2(
      {super.key,
      required this.asset,
      required this.username,
      required this.comment,
      required this.verified,
      required this.time});

  @override
  State<CommentTile2> createState() => _CommentTile2State();
}

class _CommentTile2State extends State<CommentTile2> {
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
              ListTile(
                horizontalTitleGap: 5.w,
                contentPadding:
                    EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                leading: CircleAvatar(
                  radius: 35.r,
                  backgroundImage: Image.asset(
                    widget.asset,
                  ).image,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.username,
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
                        widget.verified
                            ? Image.asset(Assets.verified)
                            : const SizedBox()
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 110.w,
                          height: 30.h,
                          child: Text(
                            widget.comment,
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
                trailing: SizedBox(
                  width: 60.w,
                  child: Column(
                    children: [
                      Text(
                        widget.time,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: textGreyColor,
                          fontSize: 8.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
