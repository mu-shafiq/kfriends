import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';

class RoundedSmallButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color? unselectedColor;
  final Color? selectedColor;

  final Color textColor;

  final Color? shadow1;
  final Color? shadow2;
  final Function() onTap;
  final bool? selected;
  final Widget? icon;

  const RoundedSmallButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      this.unselectedColor,
      this.shadow1,
      this.shadow2,
      required this.textColor,
      required this.onTap,
      this.selected,
      this.selectedColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: ShapeDecoration(
                color: selected == true
                    ? (selectedColor ?? buttonGreenColor2)
                    : (unselectedColor ?? buttonWhiteColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: [
                  BoxShadow(
                    color: shadow1 ?? buttonBlackShadow1,
                    blurRadius: 1,
                    offset: selected == true
                        ? const Offset(-2, -2)
                        : const Offset(0, 2),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: shadow2 ?? buttonBlackShadow2,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ? 3.horizontalSpace : 0.horizontalSpace,
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selected == true ? textColor : Colors.grey,
                      fontSize: 10.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedSmallButton2 extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color bgColor;
  final Color textColor;

  final Color shadow1;
  final Color shadow2;
  final Function() onTap;
  final bool? selected;

  const RoundedSmallButton2(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.bgColor,
      required this.shadow1,
      required this.shadow2,
      required this.textColor,
      required this.onTap,
      this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: selected == true ? buttonGreenColor2 : bgColor,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
