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
import 'package:kfriends/Followers/followers.dart';
import 'package:kfriends/Followings/followings.dart';
import 'package:kfriends/KoreanGames/korean_main_screen.dart';
import 'package:kfriends/KoreanGames/korean_game_Sheet.dart';
import 'package:kfriends/KoreanGames/korean_game_result.dart';
import 'package:kfriends/KoreanGames/korean_game_screen.dart';
import 'package:kfriends/KoreanGames/season_Screen.dart';
import 'package:kfriends/Notice/notice.dart';
import 'package:kfriends/Notice/notice_view.dart';
import 'package:kfriends/PaymentScreens/buy_package.dart';
import 'package:kfriends/PaymentScreens/payment_list.dart';
import 'package:kfriends/PhonAuth/enter_phone.dart';
import 'package:kfriends/PhonAuth/verify_phone.dart';
import 'package:kfriends/ReportUser/report_Screen.dart';
import 'package:kfriends/ReportUser/report_sent.dart';
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
import 'package:kfriends/Widgets/voice_calling_screen.dart';
import 'package:kfriends/model/user.dart';

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
  static String voiceCallScreen = "/VoiceCallScreen";
  static String appSettings = "/appsettings";
  static String addPost = "/addpost";
  static String communityMain = "/communitymain";
  static String morePost = "/morepost";
  static String postView = "/postview";
  static String searchTimeline = "/searchtimeline";
  static String timlineView = "/timelineview";
  static String writetimeline = "/writetimeline";
  static String customerCenter = "/customerCenter";
  static String inquirySent = "/inquirySent";
  static String editProfile = "/editProfile";
  static String seasonScreen = "/seasonScreen";
  static String notice = "/notice";
  static String noticeView = "/noticeView";
  static String buyPackage = "/buyPackage";
  static String paymentList = "/paymentList";
  static String enterPhone = "/enterPhone";
  static String verifyPhon = "/verifyPhon";

  static String callHistory = "/callHistory";
  static String callScreen = "/callScreen";
  static String profileSetting = "/profileSetting";
  static String terms = "/terms";
  static String followers = "/followers";
  static String followings = "/followings";
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
    page: () => JoinFormScreen(),
  ),
  GetPage(
    name: Routes.bottomNavBar,
    page: () => const BottomNavBar(
      initialIndex: 0,
    ),
  ),
  GetPage(
    name: Routes.userInfo,
    page: () {
      final UserModel user = Get.arguments as UserModel;
      return UserInfo(
        user: user,
      );
    },
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
    page: () => const ReportSent(),
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
      name: Routes.voiceCallScreen,
      page: () {
        final String channelName = Get.arguments['channelName'] as String;
        final String token = Get.arguments['token'] as String;
        final int uid = Get.arguments['remoteUid'] as int;
        final String callId = Get.arguments['callId'] as String;
        final String receiverName = Get.arguments['receiverName'] as String;
        final String receiverImage = Get.arguments['receiverImage'] as String;
        return VoiceCallScreen(
          channelName: channelName,
          token: token,
          uid: uid,
          callId: callId,
          receiverName: receiverName,
          receiverImage: receiverImage,
        );
      }),
  GetPage(
    name: Routes.addPost,
    page: () => AddPost(),
  ),
  GetPage(
    name: Routes.communityMain,
    page: () => const CommunityMain(),
  ),
  GetPage(
    name: Routes.morePost,
    page: () => const MorePosts(),
  ),
  GetPage(
    name: Routes.postView,
    page: () => PostView(),
  ),
  GetPage(
    name: Routes.searchTimeline,
    page: () => const TimelineSearch(),
  ),
  GetPage(
    name: Routes.timlineView,
    page: () => TimelineView(),
  ),
  GetPage(
    name: Routes.writetimeline,
    page: () => WriteTimeLine(),
  ),
  GetPage(
    name: Routes.customerCenter,
    page: () => const CustomerCenter(),
  ),
  GetPage(
    name: Routes.inquirySent,
    page: () => const INquirySent(),
  ),
  GetPage(
    name: Routes.editProfile,
    page: () => const EditProfile(),
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
    name: Routes.buyPackage,
    page: () => const BuyPackage(),
  ),
  GetPage(
    name: Routes.paymentList,
    page: () => const PaymentList(),
  ),
  GetPage(
    name: Routes.enterPhone,
    page: () => const EnterPhonNumber(),
  ),
  GetPage(
    name: Routes.verifyPhon,
    page: () => const VerifyPhon(),
  ),
  GetPage(
    name: Routes.appSettings,
    page: () => const AppSettings(),
  ),
  GetPage(
    name: Routes.seasonScreen,
    page: () => const KoreanSeasonScreen(),
  ),
  GetPage(
    name: Routes.callHistory,
    page: () => CallHistory(),
  ),
  GetPage(
    name: Routes.callScreen,
    page: () => CallScreen(),
  ),
  GetPage(
    name: Routes.contactScreen,
    page: () => const ContactScreen(),
  ),
  GetPage(
    name: Routes.profileSetting,
    page: () => const ProfileSettings(),
  ),
  GetPage(
    name: Routes.terms,
    page: () => const Terms(),
  ),
  GetPage(
    name: Routes.followers,
    page: () => Followers(
      followers: Get.arguments,
    ),
  ),
  GetPage(
    name: Routes.followings,
    page: () => Followings(
      followings: Get.arguments,
    ),
  ),
];
