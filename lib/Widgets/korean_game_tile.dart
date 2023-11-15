import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/colors.dart';

class KoreanGameTile extends StatelessWidget {
  final int words;
  final String gameName;
  const KoreanGameTile(
      {super.key, required this.words, required this.gameName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .9.sw,
      height: 85.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameName,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 13.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'studied games',
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      '0 / $words',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textGreyColor,
                        fontSize: 10.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.15,
                      ),
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.koreanSeasonScreen);
              },
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: buttonGreenColor2,
                child: Center(
                  child: Text(
                    'START →',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textBlackColor,
                      fontSize: 11.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
