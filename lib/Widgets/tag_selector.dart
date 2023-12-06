import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:menu_button/menu_button.dart';

class TagSelector extends StatefulWidget {
  final double height;
  final double width;
  final String hint;
  final TextEditingController controller;
  final double? hintSize;
  final Widget? trailing;

  TagSelector({
    super.key,
    required this.height,
    required this.width,
    required this.hint,
    required this.controller,
    this.hintSize,
    this.trailing,
  });

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  List<String> keys = <String>[
    '#K-CULTURE',
    '#K-POP',
    '#K-DRAMA',
    '#K-BEAUTY',
    '#K-TRAVEL',
    '#K-FOOD',
    '#K-PET',
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
              child: Text(
                value,
                style: TextStyle(
                  color: textBlackColor,
                  fontSize: widget.controller.text.isEmpty ? 10.sp : 12.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0.15,
                ),
              ),
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
                        ? '#K-CULTURE'
                        : widget.controller.text,
                    style: TextStyle(
                      color: textBlackColor,
                      fontSize: widget.controller.text.isEmpty ? 10.sp : 12.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
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
