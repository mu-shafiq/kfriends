import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class CallUserTile extends StatelessWidget {
  final String asset;
  final String username;
  final String about;
  final bool verified;
  final String status;
  final String date;
  final String time;

  const CallUserTile(
      {super.key,
      required this.asset,
      required this.username,
      required this.about,
      required this.verified,
      required this.status,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
          child: ListTile(
            horizontalTitleGap: 5.w,
            contentPadding: EdgeInsets.only(left: 5.w, top: 10.h),
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
                    verified ? Image.asset(Assets.verified) : const SizedBox()
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 140.w,
                  height: 20.h,
                  child: Text(
                    about,
                    style: TextStyle(
                        color: textBlackColor,
                        fontSize: 9.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                status == 'missed'
                    ? Text(
                        'Missed Call',
                        style: TextStyle(
                          color: textPinkColor,
                          fontSize: 8.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )
                    : status == 'recieved'
                        ? Row(
                            children: [
                              Image.asset(Assets.incoming),
                              3.horizontalSpace,
                              Text(
                                time,
                                style: TextStyle(
                                  color: textGreenColor,
                                  fontSize: 8.sp,
                                  fontFamily: 'Pretendard',
                                  height: 0,
                                ),
                              ),
                            ],
                          )
                        : status == 'dialed'
                            ? Row(
                                children: [
                                  Image.asset(Assets.outgoing),
                                  3.horizontalSpace,
                                  Text(
                                    time,
                                    style: TextStyle(
                                      color: textBlueColor,
                                      fontSize: 8.sp,
                                      fontFamily: 'Pretendard',
                                      height: 0,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox()
              ],
            ),
            trailing: SizedBox(
              width: 70.w,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 8.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    6.verticalSpace,
                    Container(
                      height: 20,
                      width: 20,
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
                      child: Image.asset(
                        Assets.call,
                        scale: 1.9.sp,
                        color: textBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
