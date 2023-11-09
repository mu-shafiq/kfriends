import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class BottomBar extends StatelessWidget {
  final int index;
  const BottomBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => Get.offAll(BottomNavBar(initialIndex: index)),
          selectedItemColor: textBlackColor,
          unselectedItemColor: textBlackColor,
          selectedLabelStyle: TextStyle(
            color: textBlackColor,
            fontSize: 12.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 2,
          ),
          unselectedLabelStyle: TextStyle(
            color: textBlackColor,
            fontSize: 12.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 2,
          ),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: bottombaritem(Assets.home), label: "HOME"),
            BottomNavigationBarItem(
                icon: bottombaritem(Assets.friends), label: "FRIENDS"),
            BottomNavigationBarItem(icon: bottombaritem('logo'), label: ""),
            BottomNavigationBarItem(
                icon: bottombaritem(Assets.call), label: "CALL"),
            BottomNavigationBarItem(
                icon: bottombaritem(Assets.profile), label: "MY INFO"),
          ],
        ),
        Positioned(
          bottom: 6.h,
          child: Image.asset(
            Assets.circleBlack,
            scale: .8,
          ),
        ),
        Positioned(
          bottom: 16.h,
          child: Image.asset(
            Assets.appLogo2,
            scale: 6,
          ),
        ),
      ],
    );
  }

  Widget bottombaritem(String asset) {
    return Container(
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
      child: asset == 'logo'
          ? const SizedBox()
          : Image.asset(
              asset,
              color: textBlackColor,
            ),
    );
  }
}
