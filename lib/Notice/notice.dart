import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/notice_tile.dart';
import 'package:kfriends/Widgets/payment_tile.dart';
import 'package:kfriends/Widgets/textfield.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

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
            CustomTextfield(
                height: 40.h,
                width: .92.sw,
                hint: 'Enter your keyword 👀',
                trailing: Image.asset(Assets.search),
                controller: TextEditingController()),
            30.verticalSpace,
            SizedBox(
              width: .92.sw,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.noticeView);
                        },
                        child: const NoticeTile(
                          notice: 'Hello, Everyone! It’s notice from KFriends',
                          date: '2023.06.16',
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
    ;
  }
}
