import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Utils/socket.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/model/user.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController introController = TextEditingController();

  final _storage = const FlutterSecureStorage();

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
  UserModel? userModel;

  void setValues() {
    usernameController.text = userModel!.nickname;
    regionController.text = userModel!.region ?? '';
    jobController.text = userModel!.job ?? "";
    countryController.text = userModel!.country ?? "";
    universityController.text = userModel!.universityName ?? "";
    introController.text = userModel!.intro ?? "";
    englishProficiency.value = userModel!.englishProficiency;
    koreanProficiency.value = userModel!.koreanProficiency;
    interests.value = userModel!.interests ?? [];
    male.value = userModel!.gender == 'male';
    profileImage = File(userModel!.profileImage).obs;
    featuredImage = File(userModel!.featuredImage).obs;
    dateOfBirth = userModel!.dateOfBirth;
    profileImage = null;
    featuredImage = null;

    update();
  }

  void clearValues() {
    usernameController.clear();
    regionController.clear();
    jobController.clear();
    countryController.clear();
    universityController.clear();
    introController.clear();
    englishProficiency = ''.obs;
    koreanProficiency = ''.obs;
    interests.clear();
    male.value = true;

    dateOfBirth = DateTime.now();
    profileImage = null;
    featuredImage = null;

    update();
  }

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
        profileImage:
            'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
        featuredImage:
            'https://marketplace.canva.com/EAEmBit3KfU/1/0/1600w/canva-black-flatlay-photo-motivational-finance-quote-facebook-cover-myVl9DXwcjQ.jpg',
        nickname: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        gender: male.value ? "male" : "female",
        dateOfBirth: dateOfBirth!,
        age:
            (DateTime.now().difference(dateOfBirth ?? DateTime.now()).inDays) ~/
                12,
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
        '${Keys.serverIP}:3000/api/v1/auth/register',
        data: userModel.toJson(),
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      if (res.data[Keys.status] == Keys.success) {
        await _storage.write(
            key: Keys.bearerToken, value: res.data[Keys.data][Keys.token]);
        await _storage.write(
            key: Keys.userId, value: res.data[Keys.data][Keys.user][Keys.id]);
        currentUser = UserModel.fromJson(res.data[Keys.data][Keys.user]);
        userModel = currentUser!;
        update();
        Helper().showToast("User Registered Successfully");

        Map<String, dynamic>? resp = await Get.find<MongoDBController>()
            .patchDocument('users', userModel.id!, {
          'profileImage': (await Helper()
              .uploadImage(profileImage!.value, Keys.profileImage))!,
          'featuredImage': (await Helper()
              .uploadImage(profileImage!.value, Keys.profileImage))!
        });

        Get.delete<UsersController>();
        Get.put(UsersController(), permanent: true);
        SocketNew.connectSocket();

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
        '${Keys.serverIP}:3000/api/v1/auth/login',
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
      if (res.data[Keys.status] == Keys.success) {
        if (res.data[Keys.data] != null) {
          await _storage.write(
              key: Keys.bearerToken, value: res.data[Keys.data][Keys.token]);
          await _storage.write(
              key: Keys.userId, value: res.data[Keys.data][Keys.user][Keys.id]);
          currentUser = UserModel.fromJson(res.data[Keys.data][Keys.user]);
          String fcmToken = (await FirebaseMessaging.instance.getToken())!;
          if (currentUser!.fcmToken.isEmpty ||
              currentUser!.fcmToken != fcmToken) {
            currentUser!.fcmToken = fcmToken;
            userModel = currentUser;
            await Get.find<MongoDBController>()
                .patchDocument(Keys.users, currentUser!.id!, {
              "fcmToken": fcmToken,
            });
          }
          // });
          Helper().showToast("User Logged In Successfully");
          Get.delete<UsersController>();
          Get.put(UsersController(), permanent: true);
          SocketNew.connectSocket();
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

  Future<void> updateUser() async {
    try {
      print('3');

      EasyLoading.show();
      userModel!.profileImage = profileImage != null
          ? (await Helper()
              .uploadImage(profileImage!.value, Keys.profileImage))!
          : userModel!.profileImage;
      userModel!.featuredImage = featuredImage != null
          ? (await Helper()
              .uploadImage(profileImage!.value, Keys.profileImage))!
          : userModel!.featuredImage;
      userModel!.nickname = usernameController.text.trim();
      userModel!.gender = male.value ? "male" : "female";
      userModel!.dateOfBirth = dateOfBirth!;
      userModel!.age =
          (DateTime.now().difference(dateOfBirth ?? DateTime.now()).inDays) ~/
              12;
      userModel!.job = jobController.text.trim();
      userModel!.country = countryController.text.trim();
      userModel!.region = regionController.text.trim();
      userModel!.englishProficiency = englishProficiency.value;
      userModel!.koreanProficiency = koreanProficiency.value;
      userModel!.interests = interests;
      userModel!.universityName = universityController.text.trim();
      userModel!.intro = introController.text.trim();
      Map<String, dynamic>? res = await Get.find<MongoDBController>()
          .patchDocument('users', userModel!.id!, userModel!.toJson());

      EasyLoading.dismiss();
      if (res!['data'][Keys.status] == Keys.success) {
        getCurrentUser();
        clearValues();
        Helper().showToast("User Updated Successfully");

        Get.back();
      } else {
        getCurrentUser();
        throw Exception(res['data'][Keys.message]);
      }
    } catch (e) {
      getCurrentUser();
      EasyLoading.dismiss();
      Helper().showToast("Error in Updating User");
    }
  }

  Future<void> getCurrentUser() async {
    try {
      String userId = (await _storage.read(key: Keys.userId))!;
      Map<String, dynamic>? res =
          await Get.find<MongoDBController>().getDocument(Keys.users, userId);
      if (res![Keys.status] == Keys.success) {
        currentUser = UserModel.fromJson(res[Keys.data][Keys.user]);
        userModel = currentUser;
        setValues();
        SocketNew.connectSocket();
      } else {
        throw Exception(res[Keys.message]);
      }
    } catch (e) {
      printError(info: e.toString());
    }
    update();
  }

  @override
  void onInit() async {
    await getCurrentUser();

    super.onInit();
  }
}
