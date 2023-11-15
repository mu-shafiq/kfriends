import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/colors.dart';

class PaymentTile extends StatelessWidget {
  final String package;
  final String date;
  final String price;
  final String? description;
  const PaymentTile(
      {super.key,
      required this.package,
      required this.date,
      required this.price,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .9.sw,
      height: 80.h,
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package,
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      10.verticalSpace,
                      description == null
                          ? Text(
                              date,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 8.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          : Text(
                              description!,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: 8.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                    ],
                  ),
                  Text(
                    'KRW $price',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: textBlueColor,
                      fontSize: 10.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
