import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class IncomingCall extends StatelessWidget {
  const IncomingCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const SizedBox(),
          title: Text(
            'INCOMING CALL'.tr,
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
                children: [
                  Image.asset(
                    Assets.appLogo2,
                    scale: 15.sp,
                  ),
                  2.horizontalSpace,
                  Text(
                    'K-FRIENDS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textGreyColor,
                      fontSize: 7.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xffFFFFFF),
                  Color(0xffE2F8FF),
                  Color(0xffAFCFFF)
                ])),
            width: 1.sw,
            height: 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Assets.incomingblack,
                  color: textBlackColor,
                  scale: 1,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 65.r,
                      child: Image.asset(
                        Assets.user1,
                        scale: .5,
                      ),
                    ),
                    Text(
                      '윤지',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 24.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
                5.verticalSpace,
                SizedBox(
                  width: .8.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.outgoingCall);
                          },
                          child: Image.asset(Assets.reject)),
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.outgoingCall);
                          },
                          child: Image.asset(Assets.accept)),
                    ],
                  ),
                )
              ],
            )));
  }
}
