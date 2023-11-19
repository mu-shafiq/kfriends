// Import necessary packages
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      inLoggedIn().then((value) async {
        if (value) {
          await Get.find<AuthController>().getCurrentUser();
          Get.offAllNamed(Routes.bottomNavBar);
        } else {
          Get.offAllNamed(Routes.loginScreen);
        }
      });
    });
  }

  Future<bool> inLoggedIn() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: Keys.bearerToken);
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            color: bgWhiteColor,
            child: Center(
                child: Image.asset(
              Assets.appLogo,
            )),
          ),
        ],
      ),
    );
  }
}
