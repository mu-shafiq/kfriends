import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/CallScreen/call_screen.dart';
import 'package:kfriends/Screens/CallScreen/contact_Screen.dart';
import 'package:kfriends/Screens/CallScreen/contact_settings.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({super.key});

  @override
  State<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  int selected = 0;
  final bool isEnglish = Get.locale == const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: selected == 0 && isEnglish
            ? GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.bottomNavBar);
                },
                child: Image.asset(Assets.backArrow))
            : const SizedBox(),
        title: Container(
          width: .62.sw,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: Container(
                    width: 110.w,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CALL HISTORY'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                selected == 0 ? textBlueColor : textGreyColor,
                            fontSize: 12.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        3.horizontalSpace,
                        Text(
                          ' 📞',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  selected == 0 ? textBlueColor : textGreyColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 2),
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
                    width: 115.w,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CONTACT'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selected == 1 || selected == 2
                                ? textPinkColor
                                : textGreyColor,
                            fontSize: 10.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        3.horizontalSpace,
                        Ink(
                          color: textPinkColor,
                          child: Text(
                            ' ☎️',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selected == 1 || selected == 2
                                  ? textPinkColor
                                  : textGreyColor,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          selected == 0
              ? const SizedBox(
                  height: 0,
                  width: 0,
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                  child: selected == 2
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(Assets.blueTick),
                          ))
                      : Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(Assets.settings),
                        ))
        ],
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                selected == 0
                    ? const CallScreen()
                    : selected == 1
                        ? const ContactScreen()
                        : const ContactSettings()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
