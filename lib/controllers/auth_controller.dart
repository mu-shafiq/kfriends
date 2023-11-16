import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController introController = TextEditingController();

  RxBool male = true.obs;
  RxBool terms = true.obs;
  RxBool privacy = false.obs;

  RxString selectedJob = ''.obs;
  RxString englishProficiency = beginner.obs;
  RxString koreanProficiency = beginner.obs;

  DateTime? dateOfBirth;

  RxList<String> interests = <String>[].obs;

  Rx<File>? profileImage;
  Rx<File>? featuredImage;

  void updateJob(String newJob) {
    selectedJob.value = newJob;
    jobController.text = newJob;
    update();
  }

  void updateGender(bool gender) {
    male.value = gender;
    update();
  }

  void updateEnglishProficiency(String newProficiency) {
    englishProficiency.value = newProficiency;
    update();
  }

  void updateKoreanProficiency(String newProficiency) {
    koreanProficiency.value = newProficiency;
    update();
  }

  void updateInterests(String newInterest) {
    if (interests.contains(newInterest)) {
      interests.remove(newInterest);
    } else {
      interests.add(newInterest);
    }
    update();
  }

  Future<void> pickProfileImage() async {
    File? image = await imagePickerDialog();
    if (image != null) {
      profileImage = image.obs;
      update();
    }
  }

  Future<void> pickFeaturedImage() async {
    File? image = await imagePickerDialog();
    if (image != null) {
      featuredImage = image.obs;
      update();
    }
  }

  Future<File?> imagePickerDialog() async {
    File? image;
    await Get.dialog(
      AlertDialog(
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: SizedBox(
          height: 0.2.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedSmallButton(
                selected: true,
                onTap: () async {
                  image = await Helper().imagePicker(ImageSource.gallery);
                  Get.back();
                },
                textColor: textWhiteColor,
                shadow1: buttonBlackShadow1,
                shadow2: buttonBlackShadow2,
                selectedColor: buttonBlueColor2,
                width: 160.w,
                height: 30.h,
                text: 'Gallery',
              ),
              RoundedSmallButton(
                selected: true,
                onTap: () async {
                  image = await Helper().imagePicker(ImageSource.camera);
                  Get.back();
                },
                textColor: textWhiteColor,
                shadow1: buttonBlackShadow1,
                shadow2: buttonBlackShadow2,
                selectedColor: buttonBlueColor2,
                width: 160.w,
                height: 30.h,
                text: 'Camera',
              ),
            ],
          ),
        ),
      ),
    );
    return image;
  }

  Future<void> signUp() async {
    try {
      UserModel userModel = UserModel(
        profileImage: (await Helper()
            .uploadImage(profileImage!.value, Keys.profileImage))!,
        featuredImage: (await Helper()
            .uploadImage(featuredImage!.value, Keys.featuredImage))!,
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        gender: male.value ? "male" : "female",
        dateOfBirth: dateOfBirth!,
        userType: "global",
        country: countryController.text.trim(),
        englishProficiency: englishProficiency.value,
        interests: interests,
        intro: introController.text.trim(),
        job: jobController.text.trim(),
        koreanProficiency: koreanProficiency.value,
        region: regionController.text.trim(),
        universityName: universityController.text.trim(),
        followers: [],
        following: [],
        callLogs: [],
        contacts: [],
        fcmToken: (await FirebaseMessaging.instance.getToken())!,
      );
      Response res = await Dio().post(
        "http://usdvault.com:3000/api/v1/auth/register",
        data: userModel.toJson(),
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      if (res.data[Keys.status] == Keys.success) {
        await SharedPreferences.getInstance().then((value) {
          value.setString(Keys.bearerToken, res.data[Keys.data][Keys.token]);
          value.setString(Keys.currentUser, res.data[Keys.data][Keys.user]);
        });
        Helper().showToast("User Registered Successfully");
        Get.back();
        Get.offAllNamed(Routes.bottomNavBar);
      }
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast("Error in Registering User");
    }
  }

  Future<void> login() async {
    try {
      EasyLoading.show();
      Response res = await Dio().post(
        "http://usdvault.com:3000/api/v1/auth/login",
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
        },
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      EasyLoading.dismiss();
      print("the agora uid raw ${res.data[Keys.data][Keys.user]['agoraUid']}");
      print(
          "the agora uid ${UserModel.fromJson(res.data[Keys.data][Keys.user]).agoraUid}");
      if (res.data[Keys.status] == Keys.success) {
        if (res.data[Keys.data] != null) {
          // await SharedPreferences.getInstance().then((value) {
          //   value.setString(Keys.bearerToken, res.data[Keys.data][Keys.token]);
          //   value.setString(
          //       Keys.currentUser,
          //       jsonEncode(
          //           (res.data[Keys.data][Keys.user] as Map<String, dynamic>)));
          currentUser = UserModel.fromJson(res.data[Keys.data][Keys.user]);

          token = res.data[Keys.data][Keys.token];

          String fcmToken = (await FirebaseMessaging.instance.getToken())!;
          if (currentUser!.fcmToken.isEmpty ||
              currentUser!.fcmToken != fcmToken) {
            currentUser!.fcmToken = fcmToken;
            print(fcmToken);
            await Get.find<MongoDBController>()
                .patchDocument(Keys.users, currentUser!.id!, {
              "fcmToken": fcmToken,
            });
          }
          // });
          Helper().showToast("User Logged In Successfully");
          Get.back();
          Get.offAllNamed(Routes.bottomNavBar);
        } else {
          Get.toNamed(Routes.joinFormScreen);
        }
      } else {
        throw Exception(res.data[Keys.message]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      printError(info: e.toString());
      Helper().showToast("Error in Logging In User");
    }
  }
}
