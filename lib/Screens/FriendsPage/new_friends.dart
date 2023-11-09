import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Widgets/user_tile2.dart';

// ignore: must_be_immutable
class NewFriends extends StatefulWidget {
  const NewFriends({super.key});

  @override
  State<NewFriends> createState() => _NewFriendsState();
}

class _NewFriendsState extends State<NewFriends> {
  int _tab = 0;
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.verticalSpace,
        SizedBox(
          width: .9.sw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextfield(
                  height: 40.h,
                  width: .76.sw,
                  hint: 'Search by name',
                  hintSize: 12.sp,
                  trailing: Image.asset(Assets.search),
                  controller: TextEditingController()),
              InkWell(
                onTap: () {
                  bottomSheet();
                },
                child: Image.asset(
                  Assets.filter,
                  scale: .8.sp,
                ),
              )
            ],
          ),
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedSmallButton(
              selected: _tab == 0,
              onTap: () {
                setState(() {
                  _tab = 0;
                });
              },
              textColor: textBlackColor,
              width: 163.w,
              selectedColor: buttonYelloColor,
              height: 32.h,
              text: 'Korean',
            ),
            10.horizontalSpace,
            RoundedSmallButton(
              selected: _tab == 1,
              onTap: () {
                setState(() {
                  _tab = 1;
                });
              },
              textColor: textBlackColor,
              width: 163.w,
              selectedColor: buttonYelloColor,
              height: 32.h,
              text: 'Global',
            ),
          ],
        ),
        30.verticalSpace,
        SizedBox(
          width: .9.sw,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log('message');
                    Get.toNamed(Routes.userInfo);
                  },
                  child: const UserTile2(
                    verified: true,
                    asset: Assets.user1,
                    username: '김민준',
                    about: '안녕하세요! 반가워요!대화 걸어주세요~',
                  ),
                );
              }),
        )
      ],
    );
  }

  bottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            color: bgWhiteColor,
            height: .85.sh,
            child: Column(
              children: [
                30.verticalSpace,
                Text(
                  'SEARCH FILTER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 14.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                5.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "Age",
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
                Container(
                  width: .92.sw,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: bgWhiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        Text(
                          '12',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textGreyColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.15,
                          ),
                        ),
                        Image.asset(Assets.equal),
                        Text(
                          '100',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textGreyColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0.15,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "Gender",
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
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        selected: true,
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 160.w,
                        height: 30.h,
                        text: 'Male',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 160.w,
                        height: 30.h,
                        text: 'Female',
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "Interests",
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
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-TRAVEL',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-TRAVEL',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-DRAMA',
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-POP',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-FOOD',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: '#K-BREAUTY',
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'PET',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'GAME',
                      ),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "Country",
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
                CustomTextfield(
                  controller: country,
                  width: .9.sw,
                  height: 40.h,
                  hint: 'Select here',
                  hintSize: 10.sp,
                  trailing: Image.asset(Assets.drop),
                  textInputType: TextInputType.none,
                  ontap: () {
                    showCountryPicker(
                      context: context,
                      showSearch: false,
                      onSelect: (Country count) {
                        country.text = count.name;
                      },
                    );
                  },
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "English Proficiency",
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
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        selected: true,
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Beginner',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Intermediate',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Advanced',
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.w),
                    child: Text(
                      "Korean Proficiency",
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
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        selected: true,
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Beginner',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Intermediate',
                      ),
                      RoundedSmallButton(
                        onTap: () {},
                        textColor: textBlackColor,
                        width: 106.w,
                        height: 30.h,
                        text: 'Advanced',
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedSmallButton(
                        selected: true,
                        onTap: () {
                          Get.back();
                        },
                        textColor: textWhiteColor,
                        shadow1: buttonBlackShadow1,
                        shadow2: buttonBlackShadow2,
                        selectedColor: buttonBlueColor2,
                        width: 160.w,
                        height: 35.h,
                        text: 'Search',
                      ),
                      RoundedSmallButton(
                        onTap: () {
                          Get.back();
                        },
                        textColor: textBlackColor,
                        width: 160.w,
                        height: 35.h,
                        text: 'Reset',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
