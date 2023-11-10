import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';

class KoreanGameSheet extends StatefulWidget {
  const KoreanGameSheet({super.key});

  @override
  State<KoreanGameSheet> createState() => _KoreanGameSheetState();
}

class _KoreanGameSheetState extends State<KoreanGameSheet> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.backArrow)),
            title: Text(
              'SEASON1 (계절1)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textBlackColor,
                fontSize: 14.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ),
                          TextSpan(
                            text: 'P',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
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
          bottomNavigationBar: const BottomBar(index: 0),
          body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      Assets.speaker,
                      scale: 1.2.sp,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SCORE 0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textBlackColor,
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
          )),
    );
  }
}
