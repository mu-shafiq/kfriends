import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Widgets/birthday_selector.dart';
import 'package:kfriends/Widgets/job_selector.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Controllers/auth_controller.dart';

class JoinFormScreen extends StatelessWidget {
  JoinFormScreen({super.key});
  final bool isEnglish = Get.locale == const Locale('en', 'US');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () {
              FocusNode().unfocus();
              throw Null;
            },
            child: SafeArea(
              child: Scaffold(
                backgroundColor: bgWhiteColor,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 1.sw,
                            height: .3.sh,
                            child: controller.featuredImage != null
                                ? Image.file(
                                    controller.featuredImage!.value,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    Assets.joinFormImage,
                                    fit: BoxFit.cover,
                                    // scale: 3.sp,
                                  ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60.r,
                            backgroundImage: controller.profileImage != null
                                ? FileImage(controller.profileImage!.value)
                                : null,
                            child: controller.profileImage != null
                                ? null
                                : Image.asset(
                                    Assets.appLogo2,
                                    scale: 3.sp,
                                  ),
                          ),
                          Positioned(
                              bottom: 70.h,
                              right: 130.w,
                              child: GestureDetector(
                                onTap: () {
                                  controller.pickProfileImage();
                                },
                                child: Image.asset(
                                  Assets.camera,
                                  scale: .9,
                                ),
                              )),
                          Positioned(
                              top: 15.h,
                              right: 15.w,
                              child: GestureDetector(
                                onTap: () {
                                  controller.pickFeaturedImage();
                                },
                                child: Image.asset(
                                  Assets.camera,
                                  scale: .8,
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nickname".tr,
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textBlackColor,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CustomTextfield(
                              controller: controller.usernameController,
                              width: .9.sw,
                              height: 40.h,
                              hint: ' ',
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Gender".tr,
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
                            Row(
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
                                  text: 'Male'.tr,
                                ),
                                RoundedSmallButton(
                                  selected: !controller.male.value,
                                  onTap: () {
                                    controller.updateGender(false);
                                  },
                                  textColor: textBlackColor,
                                  width: 160.w,
                                  height: 30.h,
                                  text: 'Female'.tr,
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Birthday".tr,
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
                            BirthdaySelector(
                              controller: TextEditingController(
                                  text: controller.dateOfBirth == null
                                      ? 'YYYY-MM-DD'
                                      : controller.dateOfBirth
                                          .toString()
                                          .split(' ')[0]),
                              width: .9.sw,
                              height: 40.h,
                              hintSize: 10.sp,
                              trailing: Image.asset(Assets.drop),
                              textInputType: TextInputType.none,
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Job".tr,
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
                            JobSelector(
                              controller: controller.jobController,
                              width: .9.sw,
                              height: 40.h,
                              hint: 'Select your Job'.tr,
                              hintSize: 10.sp,
                              trailing: Image.asset(Assets.drop),
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Country".tr,
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
                            CustomTextfield(
                              controller: controller.countryController,
                              width: .9.sw,
                              height: 40.h,
                              hint: 'Select your Country'.tr,
                              hintSize: 10.sp,
                              trailing: Image.asset(Assets.drop),
                              textInputType: TextInputType.none,
                              ontap: () {
                                showCountryPicker(
                                  useSafeArea: true,
                                  countryListTheme: CountryListThemeData(
                                    flagSize: 25,
                                    backgroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.blueGrey),
                                    bottomSheetHeight:
                                        500, // Optional. Country list modal height
                                    //Optional. Sets the border radius for the bottomsheet.
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    inputDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      labelText: 'Search',
                                      hintText: 'Start typing to search',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  context: context,
                                  showSearch: true,
                                  onSelect: (Country count) {
                                    controller.countryController.text =
                                        count.name;
                                  },
                                );
                              },
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Region".tr,
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
                            CustomTextfield(
                              controller: controller.regionController,
                              width: .9.sw,
                              height: 40.h,
                              hint: '',
                              hintSize: 10.sp,
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "English Proficiency".tr,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundedSmallButton(
                                  selected:
                                      controller.englishProficiency.value ==
                                          beginner,
                                  onTap: () {
                                    controller
                                        .updateEnglishProficiency(beginner);
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: 'Beginner',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.englishProficiency.value ==
                                          intermediate,
                                  onTap: () {
                                    controller
                                        .updateEnglishProficiency(intermediate);
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: 'Intermediate',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.englishProficiency.value ==
                                          advanced,
                                  onTap: () {
                                    controller
                                        .updateEnglishProficiency(advanced);
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: 'Advanced',
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            isEnglish
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Korean Proficiency".tr,
                                      style: TextStyle(
                                        fontFamily: "Pretendard",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: textBlackColor,
                                        height: 17 / 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                : const SizedBox(),
                            isEnglish
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RoundedSmallButton(
                                        selected: controller
                                                .koreanProficiency.value ==
                                            beginner,
                                        onTap: () {
                                          controller.updateKoreanProficiency(
                                              beginner);
                                        },
                                        textColor: textBlackColor,
                                        width: 114.w,
                                        height: 30.h,
                                        text: 'Beginner',
                                      ),
                                      RoundedSmallButton(
                                        selected: controller
                                                .koreanProficiency.value ==
                                            intermediate,
                                        onTap: () {
                                          controller.updateKoreanProficiency(
                                              intermediate);
                                        },
                                        textColor: textBlackColor,
                                        width: 114.w,
                                        height: 30.h,
                                        text: 'Intermediate',
                                      ),
                                      RoundedSmallButton(
                                        selected: controller
                                                .koreanProficiency.value ==
                                            advanced,
                                        onTap: () {
                                          controller.updateKoreanProficiency(
                                              advanced);
                                        },
                                        textColor: textBlackColor,
                                        width: 114.w,
                                        height: 30.h,
                                        text: 'Advanced',
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Interests".tr,
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textBlackColor,
                                  height: 17 / 14,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('K-TRAVEL'),
                                  onTap: () {
                                    controller.updateInterests('K-TRAVEL');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-TRAVEL',
                                ),
                                RoundedSmallButton(
                                  selected: controller.interests
                                      .contains('K-TRAVELS'),
                                  onTap: () {
                                    controller.updateInterests('K-TRAVELS');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-TRAVELS',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('K-DRAMA'),
                                  onTap: () {
                                    controller.updateInterests('K-DRAMA');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-DRAMA',
                                ),
                              ],
                            ),
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('K-POP'),
                                  onTap: () {
                                    controller.updateInterests('K-POP');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-POP',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('K-FOOD'),
                                  onTap: () {
                                    controller.updateInterests('K-FOOD');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-FOOD',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('K-BEAUTY'),
                                  onTap: () {
                                    controller.updateInterests('K-BEAUTY');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: '#K-BEAUTY',
                                ),
                              ],
                            ),
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('PET'),
                                  onTap: () {
                                    controller.updateInterests('PET');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
                                  height: 30.h,
                                  text: 'PET',
                                ),
                                RoundedSmallButton(
                                  selected:
                                      controller.interests.contains('GAME'),
                                  onTap: () {
                                    controller.updateInterests('GAME');
                                  },
                                  textColor: textBlackColor,
                                  width: 114.w,
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
                            10.verticalSpace,
                            !isEnglish
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "좋아하는 국가".tr,
                                      style: TextStyle(
                                        fontFamily: "Pretendard",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: textBlackColor,
                                        height: 17 / 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                : const SizedBox(),
                            !isEnglish
                                ? CustomTextfield(
                                    controller: controller.countryController,
                                    width: .9.sw,
                                    height: 40.h,
                                    hint: '선택하세요'.tr,
                                    hintSize: 10.sp,
                                    trailing: Image.asset(Assets.drop),
                                    textInputType: TextInputType.none,
                                    ontap: () {
                                      showCountryPicker(
                                        useSafeArea: true,
                                        countryListTheme: CountryListThemeData(
                                          flagSize: 25,
                                          backgroundColor: Colors.white,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.blueGrey),
                                          bottomSheetHeight:
                                              500, // Optional. Country list modal height
                                          //Optional. Sets the border radius for the bottomsheet.
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          inputDecoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            labelText: 'Search',
                                            hintText: 'Start typing to search',
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xFF8C98A8)
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        context: context,
                                        showSearch: true,
                                        onSelect: (Country count) {
                                          controller.countryController.text =
                                              count.name;
                                        },
                                      );
                                    },
                                  )
                                : const SizedBox(),
                            8.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "University".tr,
                                    style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: textBlackColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      " (Optional)".tr,
                                      style: TextStyle(
                                        fontFamily: "Pretendard",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomTextfield(
                              controller: controller.universityController,
                              width: .9.sw,
                              height: 40.h,
                              hint: ' ',
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Introduce yourself".tr,
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
                            CustomTextfield(
                              controller: controller.introController,
                              width: .9.sw,
                              height: .25.sh,
                              hint: ' ',
                            ),
                            15.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      !isEnglish
                                          ? "User&Terms".tr
                                          : "I agree with the".tr,
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textBlackColor,
                                          height: 18 / 12,
                                          decoration: Get.locale !=
                                                  const Locale('en', 'US')
                                              ? TextDecoration.underline
                                              : null),
                                      textAlign: TextAlign.left,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      isEnglish
                                          ? "User&Terms".tr
                                          : "I agree with the".tr,
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textBlackColor,
                                          height: 18 / 12,
                                          decorationThickness: 2,
                                          decoration: isEnglish
                                              ? TextDecoration.underline
                                              : null),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Checkbox(
                                    checkColor: controller.terms.value
                                        ? buttonBlueColor2
                                        : null,
                                    fillColor: MaterialStateProperty.all(
                                        controller.terms.value
                                            ? buttonBlueColor2
                                            : null),
                                    value: controller.terms.value,
                                    onChanged: (v) {
                                      controller.terms.value = v!;
                                      controller.update();
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      !isEnglish
                                          ? "Privacy Terms".tr
                                          : "I agree with the".tr,
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textBlackColor,
                                          height: 18 / 12,
                                          decoration: Get.locale !=
                                                  const Locale('en', 'US')
                                              ? TextDecoration.underline
                                              : null),
                                      textAlign: TextAlign.left,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      isEnglish
                                          ? "Privacy Terms".tr
                                          : "I agree with the".tr,
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: textBlackColor,
                                          height: 18 / 12,
                                          decorationThickness: 2,
                                          decoration: Get.locale ==
                                                  const Locale('en', 'US')
                                              ? TextDecoration.underline
                                              : null),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Checkbox(
                                    checkColor: controller.privacy.value
                                        ? buttonBlueColor2
                                        : null,
                                    fillColor: MaterialStateProperty.all(
                                        controller.privacy.value
                                            ? buttonBlueColor2
                                            : null),
                                    value: controller.privacy.value,
                                    onChanged: (v) {
                                      controller.privacy.value = v!;
                                      controller.update();
                                    })
                              ],
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundedSmallButton(
                                  selected: true,
                                  onTap: () {
                                    String alertContent = '';
                                    if (controller.profileImage == null) {
                                      alertContent +=
                                          'Please select your profile image';
                                    }
                                    if (controller.featuredImage == null) {
                                      alertContent +=
                                          '\nPlease select your featured image';
                                    }
                                    if (controller
                                        .usernameController.text.isEmpty) {
                                      alertContent +=
                                          '\nPlease enter your nickname';
                                    }
                                    if (controller.dateOfBirth == null) {
                                      alertContent +=
                                          '\nPlease enter your birthday';
                                    }
                                    if (controller.jobController.text.isEmpty) {
                                      alertContent += '\nPlease enter your job';
                                    }
                                    if (controller
                                        .countryController.text.isEmpty) {
                                      alertContent +=
                                          '\nPlease enter your country';
                                    }
                                    if (controller
                                        .regionController.text.isEmpty) {
                                      alertContent +=
                                          '\nPlease enter your region';
                                    }
                                    if (controller.interests.isEmpty) {
                                      alertContent +=
                                          '\nPlease select at least one interest';
                                    }
                                    if (controller
                                        .introController.text.isEmpty) {
                                      alertContent +=
                                          '\nPlease enter your introduction';
                                    }
                                    if (controller.terms.value == false) {
                                      alertContent +=
                                          '\nPlease agree with the User&Terms';
                                    }
                                    if (controller.privacy.value == false) {
                                      alertContent +=
                                          '\nPlease agree with the Privacy Terms';
                                    }
                                    print(alertContent);
                                    if (alertContent.isNotEmpty) {
                                      Helper().showAlertDialog(alertContent);
                                    } else {
                                      controller.signUp();
                                    }
                                  },
                                  textColor: textWhiteColor,
                                  shadow1: buttonBlackShadow1,
                                  shadow2: buttonBlackShadow2,
                                  selectedColor: buttonBlueColor2,
                                  width: 170.w,
                                  height: 35.h,
                                  text: 'Ok'.tr,
                                ),
                                RoundedSmallButton(
                                  onTap: () {
                                    Get.back();
                                  },
                                  textColor: textBlackColor,
                                  width: 170.w,
                                  height: 35.h,
                                  text: 'Cancel'.tr,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class JobOption extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final Function onTap;

  const JobOption({
    super.key,
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          color: isSelected ? buttonBlueColor2 : Colors.transparent,
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
