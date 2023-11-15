import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/payment_tile.dart';

class BuyPackage extends StatelessWidget {
  const BuyPackage({super.key});

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
          'BUY CALL PACKAGE',
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
            SizedBox(
              width: .9.sw,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: const PaymentTile(
                        package: 'Buy Basic Call Package',
                        date: '2023.06.16',
                        price: "99,000",
                        description: '240 Minutes + Free 30 Minutes',
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
