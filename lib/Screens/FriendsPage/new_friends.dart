import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Widgets/user_tile2.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/model/user.dart';
import 'package:numberpicker/numberpicker.dart';

class NewFriends extends StatefulWidget {
  const NewFriends({super.key});

  @override
  State<NewFriends> createState() => _NewFriendsState();
}

class _NewFriendsState extends State<NewFriends> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: UsersController(),
        builder: (controller) {
          print(controller.initAge.value);
          print(controller.isFilterApplied.value);
          print(controller.country.text);
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
                      controller: controller.newFriendController,
                      onChanged: (String val) {
                        controller.onSearchChanged(val);
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        await bottomSheet(controller);
                        controller.update();
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
                    selected: controller.tab == 0,
                    onTap: () {
                      setState(() {
                        controller.tab = 0;
                      });
                    },
                    textColor: textBlackColor,
                    width: 163.w,
                    selectedColor: buttonYellowColor,
                    height: 32.h,
                    text: 'Korean',
                  ),
                  10.horizontalSpace,
                  RoundedSmallButton(
                    selected: controller.tab == 1,
                    onTap: () {
                      setState(() {
                        controller.tab = 1;
                      });
                    },
                    textColor: textBlackColor,
                    width: 163.w,
                    selectedColor: buttonYellowColor,
                    height: 32.h,
                    text: 'Global',
                  ),
                ],
              ),
              30.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: FutureBuilder<List<UserModel>>(
                    future: controller.getNewFriends(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<UserModel> users = snapshot.data ?? [];
                      if (users.isEmpty) {
                        return Center(
                            child: Text(
                                'No ${controller.tab == 0 ? "korean" : "global"} user found'));
                      }
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: users.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            UserModel user = users[index];
                            return InkWell(
                              onTap: () async {
                                await Get.toNamed(Routes.userInfo,
                                    arguments: user);
                                controller.update();
                              },
                              child: UserTile2(
                                verified: user.userType == korean,
                                asset: Assets.user1,
                                username: user.username,
                                about: user.intro!,
                              ),
                            );
                          });
                    }),
              )
            ],
          );
        });
  }

  Future bottomSheet(UsersController controller) async {
    await showModalBottomSheet(
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, set) {
            return Container(
              decoration: const BoxDecoration(
                color: bgWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              height: .90.sh,
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                    5.verticalSpace,
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.w),
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
                            InkWell(
                              onTap: () {
                                log('message');
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, set2) {
                                        return SizedBox(
                                          width: 1.sw,
                                          height: .4.sh,
                                          child: NumberPicker(
                                            value: initAge,
                                            minValue: 0,
                                            maxValue: 12,
                                            onChanged: (value) {
                                              set(() {
                                                set2(() {
                                                  initAge = value;
                                                });
                                              });
                                            },
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: SizedBox(
                                width: 40.w,
                                height: 20.h,
                                child: Center(
                                  child: Text(
                                    initAge.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: 10.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(Assets.equal),
                            InkWell(
                              onTap: () {
                                log('message');
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, set1) {
                                        return SizedBox(
                                          width: 1.sw,
                                          height: .4.sh,
                                          child: NumberPicker(
                                            value: finalAge,
                                            minValue: 0,
                                            maxValue: 100,
                                            onChanged: (value) {
                                              set(() {
                                                set1(() {
                                                  finalAge = value;
                                                });
                                              });
                                            },
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: SizedBox(
                                width: 40.w,
                                height: 20.h,
                                child: Center(
                                  child: Text(
                                    finalAge.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: 10.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.15,
                                    ),
                                  ),
                                ),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.w),
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
                            width: 165.w,
                            height: 30.h,
                            text: 'Male',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 165.w,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.w),
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
                      width: .92.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-TRAVEL',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-TRAVEL',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-DRAMA',
                          ),
                        ],
                      ),
                    ),
                    5.verticalSpace,
                    SizedBox(
                      width: .92.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-POP',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-FOOD',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: '#K-BREAUTY',
                          ),
                        ],
                      ),
                    ),
                    5.verticalSpace,
                    SizedBox(
                      width: .92.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
                            text: 'PET',
                          ),
                          RoundedSmallButton(
                            onTap: () {},
                            textColor: textBlackColor,
                            width: 112.w,
                            height: 35.h,
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
                          InkWell(
                            onTap: () async {
                              log('message');
                              await showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, set2) {
                                      return SizedBox(
                                        width: 1.sw,
                                        height: .4.sh,
                                        child: NumberPicker(
                                          value: controller.initAge.value,
                                          minValue: 0,
                                          maxValue: 12,
                                          onChanged: (value) {
                                            controller.initAge.value = value;

                                            set2(() {});
                                          },
                                        ),
                                      );
                                    });
                                  });
                              set(() {});
                            },
                            child: SizedBox(
                              width: 40.w,
                              height: 20.h,
                              child: Center(
                                child: Text(
                                  controller.initAge.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 0.15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(Assets.equal),
                          InkWell(
                            onTap: () {
                              log('message');
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, set1) {
                                      return SizedBox(
                                        width: 1.sw,
                                        height: .4.sh,
                                        child: NumberPicker(
                                          value: controller.finalAge.value,
                                          minValue: 0,
                                          maxValue: 100,
                                          onChanged: (value) {
                                            controller.finalAge.value = value;
                                          },
                                        ),
                                      );
                                    });
                                  });
                              set(() {});
                            },
                            child: SizedBox(
                              width: 40.w,
                              height: 20.h,
                              child: Center(
                                child: Text(
                                  controller.finalAge.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 10.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 0.15,
                                  ),
                                ),
                              ),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                          selected: controller.male.value,
                          onTap: () {
                            controller.updateGender(true);
                          },
                          textColor: textBlackColor,
                          width: 160.w,
                          height: 30.h,
                          text: 'Male',
                        ),
                        RoundedSmallButton(
                          selected: !controller.male.value,
                          onTap: () {
                            controller.updateGender(false);
                          },
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                          selected: controller.interests.contains('#K-TRAVELS'),
                          onTap: () {
                            controller.updateInterests('#K-TRAVELS');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-TRAVELS',
                        ),
                        RoundedSmallButton(
                          selected: controller.interests.contains('#K-TRAVEL'),
                          onTap: () {
                            controller.updateInterests('#K-TRAVEL');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-TRAVEL',
                        ),
                        RoundedSmallButton(
                          selected: controller.interests.contains('#K-DRAMA'),
                          onTap: () {
                            controller.updateInterests('#K-DRAMA');
                          },
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
                          selected: controller.interests.contains('#K-POP'),
                          onTap: () {
                            controller.updateInterests('#K-POP');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-POP',
                        ),
                        RoundedSmallButton(
                          selected: controller.interests.contains('#K-FOOD'),
                          onTap: () {
                            controller.updateInterests('#K-FOOD');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-FOOD',
                        ),
                        RoundedSmallButton(
                          selected: controller.interests.contains('#K-BEAUTY'),
                          onTap: () {
                            controller.updateInterests('#K-BEAUTY');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-BEAUTY',
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
                          selected: controller.interests.contains('PET'),
                          onTap: () {
                            controller.updateInterests('PET');
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'PET',
                        ),
                        RoundedSmallButton(
                          selected: controller.interests.contains('GAME'),
                          onTap: () {
                            controller.updateInterests('GAME');
                          },
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                    controller: controller.country,
                    width: .9.sw,
                    height: 40.h,
                    hint: 'Select here',
                    hintSize: 10.sp,
                    trailing: Image.asset(Assets.drop),
                    textInputType: TextInputType.none,
                    ontap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontSize: 16.sp, color: Colors.blueGrey),
                          bottomSheetHeight:
                              .5.sh, // Optional. Country list modal height
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
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
                      hintSize: 14.sp,
                      trailing: Image.asset(Assets.drop),
                      textInputType: TextInputType.none,
                      ontap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 16.sp, color: Colors.blueGrey),
                            bottomSheetHeight:
                                .5.sh, // Optional. Country list modal height
                            //Optional. Sets the border radius for the bottomsheet.
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            //Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.w),
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
                        onSelect: (Country count) {
                          controller.country.text = count.name;
                        },
                      );
                    },
                  ),
                  10.verticalSpace,
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                          selected:
                              controller.englishProficiency.value == beginner,
                          onTap: () {
                            controller.updateEnglishProficiency(beginner);
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Beginner',
                        ),
                        RoundedSmallButton(
                          selected: controller.englishProficiency.value ==
                              intermediate,
                          onTap: () {
                            controller.updateEnglishProficiency(intermediate);
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Intermediate',
                        ),
                        RoundedSmallButton(
                          selected:
                              controller.englishProficiency.value == advanced,
                          onTap: () {
                            controller.updateEnglishProficiency(advanced);
                          },
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.w),
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
                          selected:
                              controller.koreanProficiency.value == beginner,
                          onTap: () {
                            controller.updateKoreanProficiency(beginner);
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Beginner',
                        ),
                        RoundedSmallButton(
                          selected: controller.koreanProficiency.value ==
                              intermediate,
                          onTap: () {
                            controller.updateKoreanProficiency(intermediate);
                          },
                          textColor: textBlackColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Intermediate',
                        ),
                        RoundedSmallButton(
                          selected:
                              controller.koreanProficiency.value == advanced,
                          onTap: () {
                            controller.updateKoreanProficiency(advanced);
                          },
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
                            controller.isFilterApplied.value = true;
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
                            controller.resetFilter();
                            Get.back();
                          },
                          textColor: textBlackColor,
                          width: 160.w,
                          height: 35.h,
                          text: 'Reset',
                        ),
                      ],
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
                    20.verticalSpace,
                  ],
                ),
              ),
            );
          });
        });
  }
}
