import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class UserTile extends StatelessWidget {
  final String asset;
  final String username;
  final String about;
  final int followers;
  final bool verified;
  const UserTile(
      {super.key,
      required this.asset,
      required this.username,
      required this.about,
      required this.followers,
      required this.verified});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35.r,
              backgroundImage: Image.asset(
                asset,
              ).image,
            ),
            Row(
              children: [
                Text(
                  username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                3.horizontalSpace,
                verified ? Image.asset(Assets.verified) : const SizedBox()
              ],
            ),
            SizedBox(
              width: 80.w,
              height: 30.h,
              child: Text(
                about,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                    color: textBlackColor,
                    fontSize: 8.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '999  ',
                    style: TextStyle(
                      color: textPinkColor,
                      fontSize: 8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Followers',
                    style: TextStyle(
                      color: textGreyColor,
                      fontSize: 8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
