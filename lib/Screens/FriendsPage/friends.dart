import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/FriendsPage/my_friends.dart';
import 'package:kfriends/Screens/FriendsPage/new_friends.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/small_button.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  int _tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sh, 120.h),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(Routes.bottomNavBar);
                  },
                  child: Image.asset(Assets.backArrow)),
              title: Text(
                'FRIENDS'.tr,
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
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedSmallButton(
                  selected: _tab == 0,
                  onTap: () {
                    setState(() {
                      _tab = 0;
                    });
                  },
                  textColor: textBlackColor,
                  width: 135.w,
                  height: 37.h,
                  text: 'My Friends'.tr,
                ),
                10.horizontalSpace,
                RoundedSmallButton(
                  selected: _tab == 1,
                  onTap: () {
                    setState(() {
                      _tab = 1;
                    });
                  },
                  textColor: textBlackColor,
                  width: 135.w,
                  height: 37.h,
                  text: 'Find New Friends'.tr,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [_tab == 0 ? const MyFriends() : const NewFriends()],
          ),
        ),
      ),
    );
  }
}
