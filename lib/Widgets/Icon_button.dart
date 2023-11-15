import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';

class IconRoundedButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color bgColor;
  final Color textColor;

  final Color shadow1;
  final Color shadow2;
  final Function() onTap;
  final Widget icon;

  const IconRoundedButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.bgColor,
      required this.shadow1,
      required this.shadow2,
      required this.textColor,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: bgColor,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 10.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 3.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
