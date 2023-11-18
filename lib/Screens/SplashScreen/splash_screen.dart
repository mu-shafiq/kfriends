// Import necessary packages
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/voice_calling_screen.dart';
import 'package:kfriends/firebase_options.dart';
import 'package:kfriends/main.dart';
import 'package:uuid/uuid.dart';
import 'package:kfriends/Utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3)).then((value) {
    //   Get.toNamed(Routes.loginScreen);
    // });
  }

  // Initialize Firebase Messaging

  @override
  Widget build(BuildContext context) {
    log("ffff 5");

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
