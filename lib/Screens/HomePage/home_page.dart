import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/CommunityScreens/community_main.dart';
import 'package:kfriends/PracticeScreen/practice_screen.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/user_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(child: Image.asset(Assets.notification)),
          title: Container(
            width: 210.w,
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
                    width: 100.w,
                    height: 26.h,
                    decoration: selected == 0
                        ? ShapeDecoration(
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
                          )
                        : null,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'PRACTICE ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  selected == 0 ? textPinkColor : textGreyColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          3.horizontalSpace,
                          Text(
                            '✍️',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textYellowColor,
                              fontSize: 15.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: -.3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    child: Container(
                      width: 100.w,
                      height: 26.h,
                      decoration: selected == 1
                          ? ShapeDecoration(
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
                            )
                          : null,
                      child: Center(
                        child: Text(
                          'COMMUNITY 🌏',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selected == 1
                                ? textBlueColor
                                : const Color(0xFFC9C9C9),
                            fontSize: 10.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 15),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '49,000 ',
                          style: TextStyle(
                            color: textYellowColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'P',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 49.w,
                    height: 1,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: bgWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [selected == 0 ? PracticeScreen() : CommunityMain()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
