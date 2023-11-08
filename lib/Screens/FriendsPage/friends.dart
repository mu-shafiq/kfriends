import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Widgets/user_tile2.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Image.asset(Assets.backArrow),
        title: Text(
          'FRIENDS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textBlackColor,
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                Image.asset(
                  Assets.appLogo2,
                  scale: 15.sp,
                ),
                2.horizontalSpace,
                Text(
                  'K-FRIENDS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textGreyColor,
                    fontSize: 7.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedSmallButton(
                  selected: true,
                  onTap: () {},
                  textColor: textBlackColor,
                  shadow1: buttonBlackShadow1,
                  shadow2: buttonBlackShadow2,
                  bgColor: buttonGreenColor2,
                  width: 135.w,
                  height: 37.h,
                  text: 'My Friends',
                ),
                10.horizontalSpace,
                RoundedSmallButton(
                  onTap: () {},
                  textColor: textBlackColor,
                  shadow1: buttonBlackShadow1,
                  shadow2: buttonBlackShadow2,
                  bgColor: buttonWhiteColor,
                  width: 135.w,
                  height: 37.h,
                  text: 'Find New Friends',
                ),
              ],
            ),
            30.verticalSpace,
            CustomTextfield(
                height: 30.h,
                width: .9.sw,
                hint: 'Search by name',
                hintSize: 10.sp,
                trailing: Image.asset(Assets.search),
                controller: TextEditingController()),
            30.verticalSpace,
            SizedBox(
              width: .9.sw,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const UserTile2(
                      verified: true,
                      asset: Assets.user1,
                      username: '김민준',
                      about: '안녕하세요! 반가워요!대화 걸어주세요~',
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
