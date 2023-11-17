import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/SplashScreen/splash_screen.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'K Friends',
        getPages: pages,
        builder: EasyLoading.init(),
        initialBinding: BindingsBuilder(() {
          Get.put(MongoDBController(), permanent: true);
          Get.put(CallsController(), permanent: true);
        }),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
