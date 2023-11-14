import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Screens/CallScreen/call_history.dart';
import 'package:kfriends/Screens/CallScreen/call_screen.dart';
import 'package:kfriends/Screens/FriendsPage/friends.dart';
import 'package:kfriends/Screens/HomePage/home_page.dart';
import 'package:kfriends/Screens/MyInfo/my_info.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({Key? key, required this.initialIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedTab = widget.initialIndex;

  final List _pages = [
    const HomePage(),
    const Friends(),
    const SizedBox(),
    CallHistory(),
    const MyInfoScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            body: _pages[_selectedTab],
            bottomNavigationBar: Container(
              height: 90.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 211, 205, 205),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: BottomNavigationBar(
                elevation: 2,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedTab,
                onTap: (index) => index != 2 ? _changeTab(index) : null,
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
                  BottomNavigationBarItem(
                      icon: bottombaritem('logo'), label: ""),
                  BottomNavigationBarItem(
                      icon: bottombaritem(Assets.call), label: "CALL"),
                  BottomNavigationBarItem(
                      icon: bottombaritem(Assets.profile), label: "MY INFO"),
                ],
              ),
            ),
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
      ),
    );
  }

  Widget bottombaritem(String asset) {
    return Column(
      children: [
        10.verticalSpace,
        Container(
          height: 35.h,
          width: 35.w,
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
                  height: 57.h,
                  width: 55.w,
                  color: textBlackColor,
                ),
        ),
      ],
    );
  }
}
