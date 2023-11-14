import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';

class ChatTile extends StatelessWidget {
  final String asset;
  final String username;
  final String lastchat;
  final String time;
  final int chatCount;

  final bool verified;

  const ChatTile({
    super.key,
    required this.asset,
    required this.username,
    required this.lastchat,
    required this.time,
    required this.verified,
    required this.chatCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: .9.sw,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          child: ListTile(
            horizontalTitleGap: 5.w,
            contentPadding:
                EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h, right: 5.w),
            leading: CircleAvatar(
              radius: 35.r,
              backgroundImage: Image.asset(
                asset,
              ).image,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                Container(
                  alignment: Alignment.centerLeft,
                  width: 140.w,
                  child: Text(
                    lastchat,
                    maxLines: 2,
                    style: TextStyle(
                        color: textBlackColor,
                        fontSize: 9.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 40.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    time,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: textGreyColor,
                      fontSize: 8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  5.verticalSpace,
                  CircleAvatar(
                    radius: 8.r,
                    backgroundColor: buttonGreenColor2,
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: textBlackColor,
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
