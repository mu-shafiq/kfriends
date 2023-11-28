import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/model/user.dart';

import '../Routes/get_routes.dart';
import '../Widgets/user_tile.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.koreanMainScreen);
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: .90.sw,
                      child: Image.asset(
                        Assets.koreangame,
                        scale: .1,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.topikMainScreen);
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: .96.sw,
                      child: Image.asset(
                        Assets.topikpractice,
                        scale: .06,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Suggested Korean Friends!",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textBlackColor,
                      height: 17 / 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-CULTURE',
                      selected: true,
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-POP',
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-DRAMA',
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-FOOD',
                    ),
                  ],
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-TRAVEL',
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#K-BEAUTY',
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#PET',
                    ),
                    RoundedSmallButton2(
                      onTap: () {},
                      textColor: textBlackColor,
                      shadow1: buttonBlackShadow1,
                      shadow2: buttonBlackShadow2,
                      bgColor: buttonWhiteColor,
                      width: 81.w,
                      height: 25.h,
                      text: '#GAME',
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
            ],
          ),
        ),
        SizedBox(
          height: .19.sh,
          width: 1.sw,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.userInfo, arguments: currentUser);
                  },
                  child: const UserTile(
                    verified: true,
                    asset: Assets.user1,
                    username: '김민준',
                    about: '안녕하세요! 반가워요!대화 걸어주세요~',
                    followers: 999,
                  ),
                );
              }),
        )
      ],
    );
  }
}
