import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/call_user_tile.dart';
import 'package:kfriends/Widgets/user_tile2.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          Container(
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'CALL HISTORY ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textBlueColor,
                                    fontSize: 12.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  '📞',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textYellowColor,
                                      fontSize: 10.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 2),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CONTACT ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  '☎️',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textPinkColor,
                                      fontSize: 10.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 2),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox()
                ],
              ),
              30.verticalSpace,
              Container(
                alignment: Alignment.center,
                width: .9.sw,
                height: 30.h,
                decoration: ShapeDecoration(
                  color: boxBlueColor,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Call Duration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    20.horizontalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '123:51',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    20.horizontalSpace,
                    Text(
                      '|',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textWhiteColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    20.horizontalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Remain Call Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    20.horizontalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '240:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Container(
                width: .9.sw,
                height: 30.h,
                decoration: ShapeDecoration(
                  color: bgWhiteColor,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 124.w,
                        height: 12.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '2023-03-28',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.15,
                              ),
                            ),
                            Image.asset(Assets.calender),
                          ],
                        ),
                      ),
                      Image.asset(Assets.equal),
                      SizedBox(
                        width: 124.w,
                        height: 12.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '2023-06-28',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0.15,
                              ),
                            ),
                            Image.asset(Assets.calender),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              30.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const CallUserTile(
                        date: '2023-06-27',
                        status: 'recieved',
                        verified: true,
                        asset: Assets.user1,
                        username: '김민준',
                        about: '20 / FEMALE /  South Korea',
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
