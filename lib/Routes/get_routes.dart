import 'package:get/get.dart';
import 'package:kfriends/CallScreens/incoming_call.dart';
import 'package:kfriends/CallScreens/outgoing_call.dart';
import 'package:kfriends/ChatScreens/chat_main.dart';
import 'package:kfriends/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:kfriends/Screens/JoinFormScreen/join_form_screen.dart';
import 'package:kfriends/Screens/LoginScreen/login_screen.dart';
import 'package:kfriends/Screens/SplashScreen/splash_screen.dart';
import 'package:kfriends/Screens/UserScreen/user_screen.dart';
import 'package:kfriends/UserInfo/user_info.dart';

class Routes {
  static String splashScreen = "/splashscreen";
  static String usersScreen = "/usersscreen";
  static String loginScreen = "/loginscreen";
  static String joinFormScreen = "/joinformscreen";
  static String bottomNavBar = "/bottomnavbar";
  static String userInfo = "/userinfo";
  static String incomingCall = "/incomingcall";
  static String outgoingCall = "/outgoingcall";
  static String chatMainScreen = "/chatmainscreen";
}

final pages = [
  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.usersScreen,
    page: () => const UserScreen(),
  ),
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.joinFormScreen,
    page: () => const JoinFormScreen(),
  ),
  GetPage(
    name: Routes.bottomNavBar,
    page: () => const BottomNavBar(
      initialIndex: 0,
    ),
  ),
  GetPage(
    name: Routes.userInfo,
    page: () => const UserInfo(),
  ),
  GetPage(
    name: Routes.incomingCall,
    page: () => const IncomingCall(),
  ),
  GetPage(
    name: Routes.outgoingCall,
    page: () => const OutgoingCall(),
  ),
  GetPage(
    name: Routes.chatMainScreen,
    page: () => const ChatMainScreen(),
  ),
];
