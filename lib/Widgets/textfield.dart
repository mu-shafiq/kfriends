import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final double height;
  final double width;
  final String hint;
  final TextEditingController controller;
  final double? hintSize;
  final Widget? trailing;
  final TextInputType? textInputType;
  final Function()? ontap;

  const CustomTextfield(
      {super.key,
      required this.height,
      required this.width,
      required this.hint,
      required this.controller,
      this.hintSize,
      this.trailing,
      this.textInputType,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        keyboardType: textInputType,
        onTap: ontap,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.h),
            suffixIcon: trailing ?? const SizedBox(),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: bgWhiteColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: borderBlueColor, width: 1.3)),
            hintText: hint,
            hintStyle:
                TextStyle(color: hintTextColor, fontSize: hintSize ?? 13.sp)),
      ),
    );
  }
}
