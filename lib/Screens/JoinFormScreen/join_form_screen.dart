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

class JoinFormScreen extends StatefulWidget {
  const JoinFormScreen({super.key});

  @override
  State<JoinFormScreen> createState() => _JoinFormScreenState();
}

class _JoinFormScreenState extends State<JoinFormScreen> {
  bool terms = true;
  bool privacy = false;
  TextEditingController job = TextEditingController();
  TextEditingController country = TextEditingController();

  String? selectedJob;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgWhiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Assets.joinFormImage),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60.r,
                    child: Image.asset(
                      Assets.appLogo2,
                      scale: 3.sp,
                    ),
                  ),
                  Positioned(
                      bottom: 60.h,
                      right: 122.w,
                      child: Image.asset(
                        Assets.camera,
                        scale: .8,
                      )),
                  Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Image.asset(
                        Assets.camera,
                        scale: .8,
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
                        "Nickname",
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
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 40.h,
                      hint: ' ',
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          selected: true,
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonGreenColor2,
                          width: 160.w,
                          height: 30.h,
                          text: 'Male',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 160.w,
                          height: 30.h,
                          text: 'Female',
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Birthday",
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
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 40.h,
                      hint: 'YYYY-MM-DD',
                      hintSize: 10.sp,
                      trailing: Image.asset(Assets.drop),
                      textInputType: TextInputType.none,
                      ontap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 100000)),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 100000)));
                      },
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Job",
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
                      controller: job,
                      width: .9.sw,
                      height: 40.h,
                      hint: 'Select your Job',
                      hintSize: 10.sp,
                      trailing: Image.asset(Assets.drop),
                      textInputType: TextInputType.none,
                      ontap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Select Your Job"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  JobOption(
                                    gender: 'Student',
                                    isSelected: selectedJob == 'Student',
                                    onTap: () {
                                      setState(() {
                                        selectedJob = 'Student';
                                        job.text = selectedJob!;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  JobOption(
                                    gender: 'University Student',
                                    isSelected:
                                        selectedJob == 'University Student',
                                    onTap: () {
                                      setState(() {
                                        selectedJob = 'University Student';
                                        job.text = selectedJob!;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  JobOption(
                                    gender: 'Home maker',
                                    isSelected: selectedJob == 'Home maker',
                                    onTap: () {
                                      setState(() {
                                        selectedJob = 'Home maker';
                                        job.text = selectedJob!;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  JobOption(
                                    gender: 'Office worker',
                                    isSelected: selectedJob == 'Office worker',
                                    onTap: () {
                                      setState(() {
                                        selectedJob = 'Office worker';
                                        job.text = selectedJob!;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                            ;
                          },
                        );
                      },
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    CustomTextfield(
                      controller: country,
                      width: .9.sw,
                      height: 40.h,
                      hint: 'Select your Country',
                      hintSize: 10.sp,
                      trailing: Image.asset(Assets.drop),
                      textInputType: TextInputType.none,
                      ontap: () {
                        showCountryPicker(
                          context: context,
                          showSearch: false,
                          onSelect: (Country count) {
                            log(count.name);
                            country.text = count.name;
                          },
                        );
                      },
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Region",
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
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 40.h,
                      hint: '',
                      hintSize: 10.sp,
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          selected: true,
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonGreenColor2,
                          width: 106.w,
                          height: 30.h,
                          text: 'Beginner',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Intermediate',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Advanced',
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          selected: true,
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonGreenColor2,
                          width: 106.w,
                          height: 30.h,
                          text: 'Beginner',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Intermediate',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'Advanced',
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Text(
                      "Interests",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textBlackColor,
                        height: 17 / 14,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-TRAVEL',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-TRAVEL',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-DRAMA',
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-POP',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-FOOD',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: '#K-BREAUTY',
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 106.w,
                          height: 30.h,
                          text: 'PET',
                        ),
                        RoundedSmallButton(
                          onTap: () {},
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
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
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "University",
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: textBlackColor,
                              height: 17 / 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            " (Optional)",
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              height: 17 / 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    CustomTextfield(
                      controller: TextEditingController(),
                      width: .9.sw,
                      height: 40.h,
                      hint: ' ',
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Introduce yourself",
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
                      controller: TextEditingController(),
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
                              "I agree with the",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: textBlackColor,
                                height: 18 / 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " User&Terms",
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textBlackColor,
                                  height: 18 / 12,
                                  decorationThickness: 2,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Checkbox(
                            checkColor: terms ? buttonBlueColor2 : null,
                            fillColor: MaterialStateProperty.all(
                                terms ? buttonBlueColor2 : null),
                            value: terms,
                            onChanged: (v) {
                              setState(() {
                                terms = v!;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "I agree with the",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: textBlackColor,
                                height: 18 / 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              " Privacy Terms",
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textBlackColor,
                                  height: 18 / 12,
                                  decorationThickness: 2,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Checkbox(
                            checkColor: privacy ? buttonBlueColor2 : null,
                            fillColor: MaterialStateProperty.all(
                                privacy ? buttonBlueColor2 : null),
                            value: privacy,
                            onChanged: (v) {
                              setState(() {
                                privacy = v!;
                              });
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
                            // set up the button
                            Widget okButton = Center(
                              child: RoundedSmallButton(
                                onTap: () {
                                  Get.offAndToNamed(Routes.bottomNavBar);
                                },
                                textColor: textWhiteColor,
                                shadow1: buttonBlackShadow1,
                                shadow2: buttonBlackShadow2,
                                bgColor: buttonBlueColor2,
                                width: 160.w,
                                height: 30.h,
                                text: 'Ok',
                              ),
                            );

                            // set up the AlertDialog
                            AlertDialog alert = AlertDialog(
                              shape: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              content: SizedBox(
                                  height: .06.sh,
                                  width: .8.sw,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      "[alert contnet]",
                                      style: TextStyle(
                                        fontFamily: "Pretendard",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textBlackColor,
                                        height: 15 / 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                              actions: [
                                okButton,
                              ],
                            );

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          textColor: textWhiteColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonBlueColor2,
                          width: 160.w,
                          height: 30.h,
                          text: 'Ok',
                        ),
                        RoundedSmallButton(
                          onTap: () {
                            Get.back();
                          },
                          textColor: textBlackColor,
                          shadow1: buttonBlackShadow1,
                          shadow2: buttonBlackShadow2,
                          bgColor: buttonWhiteColor,
                          width: 160.w,
                          height: 30.h,
                          text: 'Cancel',
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
    );
  }
}

class JobOption extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final Function onTap;

  JobOption({
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
