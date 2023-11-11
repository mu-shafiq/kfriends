import 'package:get/get.dart';
import 'package:kfriends/AppSettings/app_settings.dart';
import 'package:kfriends/CallScreens/incoming_call.dart';
import 'package:kfriends/CallScreens/outgoing_call.dart';
import 'package:kfriends/ChatScreens/ai_chat.dart';
import 'package:kfriends/ChatScreens/chat_main.dart';
import 'package:kfriends/ChatScreens/chat_settings.dart';
import 'package:kfriends/ChatScreens/chating_Screen.dart';
import 'package:kfriends/CommunityScreens/add_post.dart';
import 'package:kfriends/CommunityScreens/community_main.dart';
import 'package:kfriends/CommunityScreens/more_post.dart';
import 'package:kfriends/CommunityScreens/post_view.dart';
import 'package:kfriends/CommunityScreens/search_timeline.dart';
import 'package:kfriends/CommunityScreens/timeline_view.dart';
import 'package:kfriends/CommunityScreens/write_timeline.dart';
import 'package:kfriends/CustomerCenter/customer_center.dart';
import 'package:kfriends/CustomerCenter/inquiry_sent.dart';
import 'package:kfriends/EditProfile/edit_profile.dart';
import 'package:kfriends/KoreanGames/korean_main_screen.dart';
import 'package:kfriends/KoreanGames/korean_game_Sheet.dart';
import 'package:kfriends/KoreanGames/korean_game_result.dart';
import 'package:kfriends/KoreanGames/korean_game_screen.dart';
import 'package:kfriends/KoreanGames/season_Screen.dart';
import 'package:kfriends/Notice/notice.dart';
import 'package:kfriends/Notice/notice_view.dart';
import 'package:kfriends/PaymentScreens/buy_package.dart';
import 'package:kfriends/PaymentScreens/payment_list.dart';
import 'package:kfriends/ReportUser/report_Screen.dart';
import 'package:kfriends/Screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:kfriends/Screens/CallScreen/call_history.dart';
import 'package:kfriends/Screens/CallScreen/call_screen.dart';
import 'package:kfriends/Screens/CallScreen/contact_Screen.dart';
import 'package:kfriends/Screens/CallScreen/contact_settings.dart';
import 'package:kfriends/Screens/JoinFormScreen/join_form_screen.dart';
import 'package:kfriends/Screens/LoginScreen/login_screen.dart';
import 'package:kfriends/Screens/MyInfo/profile_Settings.dart';
import 'package:kfriends/Screens/SplashScreen/splash_screen.dart';
import 'package:kfriends/Screens/UserScreen/user_screen.dart';
import 'package:kfriends/Terms/terms.dart';
import 'package:kfriends/TopikPractice/topik_main_screen.dart';
import 'package:kfriends/TopikPractice/topik_test_Screen.dart';
import 'package:kfriends/TopikPractice/topik_test_result.dart';
import 'package:kfriends/TopikPractice/topik_test_sheet.dart';
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
  static String chatSettings = "/chatsettings";
  static String chatingScreen = "/chatingscreen";
  static String aiChat = "/aichat";
  static String reportScreen = "/reportscreen";
  static String reportSent = "/reportsent";
  static String contactScreen = "/contactscreen";
  static String contactSettings = "/contactsettings";
  static String topikMainScreen = "/topikmainscreen";
  static String topikTestScreen = "/topiktestscreen";
  static String topikTestSheet = "/topiktestsheet";
  static String topikTestResult = "/topiktestresult";

  static String koreanMainScreen = "/koreanmainscreen";
  static String koreanGameScreen = "/koreangamescreen";
  static String koreanGameSheet = "/koreangamesheet";
  static String koreanGameResult = "/koreangameresult";
  static String koreanSeasonScreen = "/koreanseasonscreen";
  static String communityMain = "/communityMain";
  static String morePosts = "/moreposts";
  static String addPosts = "/addposts";
  static String viewPosts = "/viewposts";
  static String timelineview = "/timelineview";
  static String timelineWrite = "/timelinewrite";
  static String timelineSearch = "/timelinesearch";
  static String profileSettings = "/profilesettings";
  static String paymentList = "/paymentlist";
  static String buyPayment = "/buypayment";
  static String notice = "/notice";
  static String noticeView = "/noticeview";
  static String appSettings = "/appsettings";
  static String customerCenter = "/customercenter";
  static String callScreen = "/callscreen";
  static String inquirySent = "/inquirysent";
  static String terms = "/terms";
  static String editprofile = "/editprofile";
  static String callHistory = "/callhistory";
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
  GetPage(
    name: Routes.chatSettings,
    page: () => const ChatSettings(),
  ),
  GetPage(
    name: Routes.aiChat,
    page: () => const AiChat(),
  ),
  GetPage(
    name: Routes.chatingScreen,
    page: () => const ChatingScreen(),
  ),
  GetPage(
    name: Routes.reportScreen,
    page: () => const ReportScreen(),
  ),
  GetPage(
    name: Routes.reportSent,
    page: () => const ContactScreen(),
  ),
  GetPage(
    name: Routes.contactSettings,
    page: () => const ContactSettings(),
  ),
  GetPage(
    name: Routes.topikMainScreen,
    page: () => const TopikMainScreen(),
  ),
  GetPage(
    name: Routes.topikTestScreen,
    page: () => const TopikTestScreen(),
  ),
  GetPage(
    name: Routes.topikTestSheet,
    page: () => const TopikTestSheet(),
  ),
  GetPage(
    name: Routes.topikTestResult,
    page: () => const TopikTestResult(),
  ),
  GetPage(
    name: Routes.koreanMainScreen,
    page: () => const KoreanMainScreen(),
  ),
  GetPage(
    name: Routes.koreanGameScreen,
    page: () => const KoreanGameScreen(),
  ),
  GetPage(
    name: Routes.koreanGameSheet,
    page: () => const KoreanGameSheet(),
  ),
  GetPage(
    name: Routes.koreanGameResult,
    page: () => const KoreanGameResult(),
  ),
  GetPage(
    name: Routes.koreanSeasonScreen,
    page: () => const KoreanSeasonScreen(),
  ),
  GetPage(
    name: Routes.communityMain,
    page: () => const CommunityMain(),
  ),
  GetPage(
    name: Routes.morePosts,
    page: () => const MorePosts(),
  ),
  GetPage(
    name: Routes.addPosts,
    page: () => const AddPost(),
  ),
  GetPage(
    name: Routes.viewPosts,
    page: () => const PostView(),
  ),
  GetPage(
    name: Routes.timelineview,
    page: () => const TimelineView(),
  ),
  GetPage(
    name: Routes.timelineWrite,
    page: () => const WriteTimeLine(),
  ),
  GetPage(
    name: Routes.timelineSearch,
    page: () => const TimelineSearch(),
  ),
  GetPage(
    name: Routes.profileSettings,
    page: () => const ProfileSettings(),
  ),
  GetPage(
    name: Routes.paymentList,
    page: () => const PaymentList(),
  ),
  GetPage(
    name: Routes.buyPayment,
    page: () => const BuyPackage(),
  ),
  GetPage(
    name: Routes.notice,
    page: () => const Notice(),
  ),
  GetPage(
    name: Routes.noticeView,
    page: () => const NoticeViews(),
  ),
  GetPage(
    name: Routes.appSettings,
    page: () => const AppSettings(),
  ),
  GetPage(
    name: Routes.customerCenter,
    page: () => const CustomerCenter(),
  ),
  GetPage(
    name: Routes.callScreen,
    page: () => CallScreen(),
  ),
  GetPage(
    name: Routes.terms,
    page: () => const Terms(),
  ),
  GetPage(
    name: Routes.editprofile,
    page: () => const EditProfile(),
  ),
  GetPage(
    name: Routes.callHistory,
    page: () => CallHistory(),
  ),
];
