import 'dart:developer';

import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';

class BirthdaySelector extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController controller;
  final double? hintSize;
  final Widget? trailing;
  final TextInputType? textInputType;

  const BirthdaySelector({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    this.hintSize,
    this.trailing,
    this.textInputType,
  });

  @override
  State<BirthdaySelector> createState() => _BirthdaySelectorState();
}

class _BirthdaySelectorState extends State<BirthdaySelector> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          // padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 211, 205, 205),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 1,
              )
            ],
          ),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: CupertinoDateTextBox(
                color: Colors.white,
                initialValue: DateTime.now(),
                hintColor: textGreyColor,
                onDateChange: (onDateChangeCallback) {
                  setState(() {
                    widget.controller.text =
                        onDateChangeCallback.toString().split(' ').first;
                  });
                },
                hintText: ''),
          ),
        ),
        Positioned(
          left: 10.w,
          child: Text(
            widget.controller.text.isEmpty
                ? 'YYYY-MM-DD'
                : widget.controller.text,
            style: TextStyle(
              color: widget.controller.text.isEmpty
                  ? textGreyColor
                  : textBlackColor,
              fontSize: widget.controller.text.isEmpty ? 10.sp : 12.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.15,
            ),
          ),
        ),
        Positioned(right: 23.w, child: widget.trailing!)
      ],
    );
  }
}
