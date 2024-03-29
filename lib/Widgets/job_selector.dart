import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:menu_button/menu_button.dart';

class JobSelector extends StatefulWidget {
  final double height;
  final double width;
  final String hint;
  final TextEditingController controller;
  final double? hintSize;
  final Widget? trailing;

  JobSelector({
    super.key,
    required this.height,
    required this.width,
    required this.hint,
    required this.controller,
    this.hintSize,
    this.trailing,
  });

  @override
  State<JobSelector> createState() => _JobSelectorState();
}

class _JobSelectorState extends State<JobSelector> {
  List<String> keys = <String>[
    'Student',
    'University Student',
    'Home maker',
    'Office worker'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: MenuButton<String>(
          items: keys,
          itemBuilder: (String value) => StatefulBuilder(builder: (context, _) {
            return Container(
              height: 40,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: Text(value),
            );
          }),
          onItemSelected: (String value) {
            setState(() {
              widget.controller.text = value;
            });
          },
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.controller.text.isEmpty
                        ? widget.hint
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
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: SizedBox(
                      width: 12,
                      height: 17,
                      child: widget.trailing!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
