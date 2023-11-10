import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/Utils/colors.dart';

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

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.blue,
        fontSize: 16.0);
  }
}
