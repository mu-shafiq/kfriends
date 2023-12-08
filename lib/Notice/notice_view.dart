import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/textfield.dart';

class NoticeViews extends StatelessWidget {
  const NoticeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 4),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset(Assets.backArrow)),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'NOTICE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textBlackColor,
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
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
                    color: textGreyColor,
                    fontSize: 8.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Everyone! It’s notice from KFriends',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 12.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.appLogo2,
                  scale: 15.sp,
                ),
                Text(
                  'K-FRIENDS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textGreyColor,
                    fontSize: 8.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                7.horizontalSpace,
                Container(
                  width: 1,
                  height: 10,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
                7.horizontalSpace,
                Text(
                  '2023.06.16',
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
            30.verticalSpace,
            SizedBox(
                width: .92.sw,
                height: .65.sh,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text:
                        'Seoul is one of the hottest travel destinations in Asia offering a vibrant mix of old and new. The city has been the capital of Korea during many dynasties and is, therefore, home to various historic attractions. Moreover, the city is constantly changing with new architectural gems popping up year after year, such as Seoul is one of the hottest travel destinations in Asia offering a vibrant mix of old and new. The city has been the capital of Korea during many dynasties and is, therefore, home to various historic attractions. Moreover, the city is constantly changing with new architectural gems popping up year after year, such as Seoul is one of the hottest travel destinations in Asia offering a vibrant mix of old and new. The city has been the capital of Korea during many dynasties and is, therefore, home to various historic attractions. Moreover, the city is constantly changing with new architectural gems popping up year after year, such as Seoul is one of the hottest travel destinations in Asia offering a vibrant mix of old and new. The city has been the capital of Korea during many dynasties and is, therefore, home to various historic attractions. Moreover, the city is constantly changing with new architectural gems popping up year after year, such as ',
                    style: TextStyle(
                      color: textBlackColor,
                      fontSize: 11.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]))),
            Row(
              children: [
                Image.asset(
                  Assets.more,
                  scale: 1.5,
                ),
                10.horizontalSpace,
                Text(
                  'Back to List',
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0.15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
