import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Languages/languages.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/SplashScreen/splash_screen.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Utils/navigation_service.dart';
import 'package:kfriends/Utils/socket.dart';
// import 'package:kfriends/Widgets/voice_calling_screen.dart';
import 'package:kfriends/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data['type'] == 'call') {
    _handleIncomingCall(message);
  }
}

Future<void> _handleIncomingCall(RemoteMessage message) async {
  // todo this line is causing issue for background
  await FlutterCallkitIncoming.endAllCalls();
  final params = CallKitParams(
    id: const Uuid().v4(),
    nameCaller: message.data[Keys.receiverName],
    appName: "K Friends",
    avatar: "https://i.pravatar.cc/100",
    handle: "+987456215",
    type: 0,
    duration: 20000,
    textAccept: "Accept",
    textDecline: "Decline",
    missedCallNotification: const NotificationParams(
      showNotification: true,
      isShowCallback: true,
      subtitle: "Missed call",
      callbackText: "Call back",
    ),
    extra: message.data,
    headers: <String, dynamic>{"apiKey": "Abc@123!", "platform": "flutter"},
    android: const AndroidParams(
      isCustomNotification: true,
      isShowLogo: false,
      ringtonePath: 'system_ringtone_default',
      backgroundColor: '#0955fa',
      backgroundUrl: 'assets/test.png',
      actionColor: '#4CAF50',
    ),
    ios: const IOSParams(
      iconName: 'CallKitLogo',
      handleType: '',
      supportsVideo: true,
      maximumCallGroups: 2,
      maximumCallsPerCallGroup: 1,
      audioSessionMode: 'default',
      audioSessionActive: true,
      audioSessionPreferredSampleRate: 44100.0,
      audioSessionPreferredIOBufferDuration: 0.005,
      supportsDTMF: true,
      supportsHolding: true,
      supportsGrouping: false,
      supportsUngrouping: false,
      ringtonePath: 'system_ringtone_default',
    ),
  );
  FlutterCallkitIncoming.onEvent.listen((event) async {
    if (event!.event == Event.actionCallDecline) {
      String callId = message.data[Keys.callId];
      final mongodbController = Get.find<MongoDBController>();
      Map<String, dynamic>? res = await mongodbController.callFunction(
        Keys.endCall,
        data: {
          'callId': callId,
          'callLogType': "declined",
        },
      );
      Helper().showToast("Call ended");
    }
  });

  await FlutterCallkitIncoming.showCallkitIncoming(params);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  _initializeFirebaseMessaging();
  String locale = await getLocale();
  SocketNew.connectSocket();
  runApp(MyApp(
    local: locale,
  ));
}

void testSocket() async {
  log("socket init");
  Socket socket = IO.io('${Keys.serverIP}:3000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });
  socket.connect();
  socket.onError((data) {
    log('here is the errorrr..........\n$data');
  });
  socket.onConnect((_) {
    log('socket connected........................');
  });
}

Future<void> _initializeFirebaseMessaging() async {
  FirebaseMessaging.instance.requestPermission();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.data['type'] == 'call') {
      _handleIncomingCall(message);
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<String> getLocale() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('locale') ?? '';
}

class MyApp extends StatefulWidget {
  final String local;
  const MyApp({Key? key, required this.local}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isLoading = true;
  bool hasActiveCall = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkAndNavigationCallingPage();
    // Initialize the future for checking active calls
    // _currentCall = checkAndNavigationCallingPage();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      checkAndNavigationCallingPage();
    }
    // if (state == AppLifecycleState.hidden) {
    //   checkAndNavigationCallingPage();
    // }
    // if (state == AppLifecycleState.inactive) {
    //   checkAndNavigationCallingPage();
    // }
  }

  Future<dynamic> checkAndNavigationCallingPage() async {
    var currentCall = await getCurrentCall();
    if (currentCall != null) {
      // If there's an active call, navigate to the call screen and return null to prevent showing the splash screen
      Helper().showToast("Call accepted");
      int agoraUid = int.parse(currentCall['extra'][Keys.uid].toString());
      String token = currentCall['extra'][Keys.token];
      String channelName = currentCall['extra'][Keys.channelName];
      String callId = currentCall['extra'][Keys.callId];
      String receiverName = currentCall['extra'][Keys.receiverName];
      String receiverImage = currentCall['extra'][Keys.receiverImage];
      setState(() {
        hasActiveCall = true;
        isLoading = false;
      });
      NavigationService.instance
          .pushNamedIfNotCurrent(Routes.voiceCallScreen, args: {
        'channelName': channelName,
        'remoteUid': agoraUid,
        'token': token,
        'callId': callId,
        'receiverName': receiverName,
        'receiverImage': receiverImage,
      });
    } else {
      setState(() {
        hasActiveCall = false;
        isLoading = false;
      });
    }
  }

  Future<dynamic> getCurrentCall() async {
    var calls = await FlutterCallkitIncoming.activeCalls();
    if (calls is List) {
      log("all calls length ${calls.length}");
      log("all calls $calls");
      if (calls.isNotEmpty) {
        return calls.last;
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        if (isLoading) {
          // Show loading indicator while checking for active calls
          return Container(
              color: Colors.white); // Placeholder for loading state
        }
        if (hasActiveCall) {
          // Active call exists, don't show SplashScreen
          return Container(); // Empty container or another placeholder
        }
        // No active call, show SplashScreen
        return buildGetMaterialApp();
      },
    );
  }

  GetMaterialApp buildGetMaterialApp() {
    return GetMaterialApp(
      navigatorKey: NavigationService.instance.navigationKey,
      translations: Languages(),
      locale: widget.local.isEmpty || widget.local == Keys.english
          ? const Locale('en', 'US')
          : const Locale('ko', 'KR'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'K Friends',
      getPages: pages,
      builder: EasyLoading.init(),
      initialBinding: BindingsBuilder(() {
        Get.put(MongoDBController(), permanent: true);
        Get.put(CallsController(), permanent: true);
        Get.put(AuthController(), permanent: true);
      }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //     designSize: const Size(375, 812),
  //     builder: (context, _) => FutureBuilder(
  //       future: _currentCall,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           if (snapshot.data == null) {
  //             // Active call exists, so we don't show SplashScreen
  //             return Container(); // Empty container or another placeholder
  //           }
  //           // No active call, show SplashScreen
  //           return GetMaterialApp(
  //             navigatorKey: NavigationService.instance.navigationKey,
  //             translations: Languages(),
  //             locale: widget.local.isEmpty || widget.local == Keys.english
  //                 ? const Locale('en', 'US')
  //                 : const Locale('ko', 'KR'),
  //             fallbackLocale: const Locale('en', 'US'),
  //             title: 'K Friends',
  //             getPages: pages,
  //             builder: EasyLoading.init(),
  //             initialBinding: BindingsBuilder(() {
  //               Get.put(MongoDBController(), permanent: true);
  //               Get.put(CallsController(), permanent: true);
  //               Get.put(AuthController(), permanent: true);
  //             }),
  //             debugShowCheckedModeBanner: false,
  //             theme: ThemeData(
  //               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //               useMaterial3: true,
  //             ),
  //             home: const SplashScreen(),
  //           );
  //         }
  //         // While waiting, show a loading screen or an empty container
  //         return Container(
  //             color: Colors.white); // Placeholder for loading state
  //       },
  //     ),
  //   );
  // }
}
