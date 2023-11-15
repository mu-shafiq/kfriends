import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/small_button.dart';

class Helper {
  Future<File?> imagePicker(ImageSource source) async {
    try {
      XFile? res = await ImagePicker().pickImage(
        source: source,
      );
      return await cropImage(res!.path);
    } on PlatformException catch (e) {
      log("error in pick image ${e.message!}");
      showToast(e.message!);
      return null;
    }
  }

  Future<File?> cropImage(String sourcePath) async {
    try {
      return File((await ImageCropper().cropImage(
        sourcePath: sourcePath,
        compressQuality: 30,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'CROP',
              activeControlsWidgetColor: boxBlueColor,
              statusBarColor: boxBlueColor,
              toolbarColor: boxBlueColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'CROP',
          )
        ],
      ))!
          .path);
    } on PlatformException catch (e) {
      log("error in crop image ${e.message!}");
      showToast(e.message!);
      return null;
    }
  }

  Future<String?> uploadImage(File? image, String folder) async {
    Uint8List? bytes = await image!.readAsBytes();
    Map<String, dynamic>? response =
        await Get.find<MongoDBController>().uploadPNG(bytes, folder);
    if (response![Keys.status] == Keys.success) {
      return response[Keys.data][Keys.url];
    } else {
      Get.find<MongoDBController>().throwExpection(response);
      return null;
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showAlertDialog(String content) {
    Get.dialog(
      AlertDialog(
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: SizedBox(
          height: .2.sh,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                content,
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: textBlackColor,
                  height: 15 / 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: RoundedSmallButton(
              onTap: () {
                Get.back();
              },
              textColor: textWhiteColor,
              shadow1: buttonBlackShadow1,
              shadow2: buttonBlackShadow2,
              selectedColor: buttonBlueColor2,
              selected: true,
              width: 160.w,
              height: 30.h,
              text: 'Ok',
            ),
          )
        ],
      ),
    );
  }
}
