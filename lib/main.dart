import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
// import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Screens/SplashScreen/splash_screen.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Utils/navigation_service.dart';
// import 'package:kfriends/Widgets/voice_calling_screen.dart';
import 'package:kfriends/firebase_options.dart';
import 'package:uuid/uuid.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data['type'] == 'call') {
    _handleIncomingCall(message);
  }
}

// Handle incoming call
Future<void> _handleIncomingCall(RemoteMessage message) async {
  log('data ${message.data}');
  // return;
  final params = CallKitParams(
    id: const Uuid().v4(),
    nameCaller: message.data[Keys.receiverName],
    appName: "K Friends",
    avatar: "https://i.pravatar.cc/100",
    handle: "+987456215",
    type: 0,
    duration: 30000,
    textAccept: "Accept",
    textDecline: "Decline",
    missedCallNotification: const NotificationParams(
      showNotification: true,
      isShowCallback: true,
      subtitle: "Missed call",
      callbackText: "Call back",
    ),
    extra: message.data as Map<String, dynamic>,
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

  await FlutterCallkitIncoming.showCallkitIncoming(params);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  _initializeFirebaseMessaging();

  runApp(const MyApp());
}

Future<void> _initializeFirebaseMessaging() async {
  FirebaseMessaging.instance.requestPermission();

  // Foreground message listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle incoming messages
    if (message.data['type'] == 'call') {
      // Handle incoming call
      _handleIncomingCall(message);
    }
  });

  // Background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String? _currentUuid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  FlutterCallkitIncoming.endAllCalls();

    WidgetsBinding.instance.addObserver(this);
    //Check call when open app from terminated
    // checkAndNavigationCallingPage();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    if (state == AppLifecycleState.resumed) {
      print('??????????????? app resumed');
      //Check call when open app from background
      checkAndNavigationCallingPage();
    }
  }

  Future<dynamic> getCurrentCall() async {
    //check current call from pushkit if possible

    var calls = await FlutterCallkitIncoming.activeCalls();

    log('all calls? ${calls}');
    if (calls is List) {
      if (calls.isNotEmpty) {
        print('DATA: $calls');
        // _currentUuid = calls[0]['id'];
        return calls[0];
      } else {
        // _currentUuid = "";
        return null;
      }
    }
  }

  Future<void> checkAndNavigationCallingPage() async {
    var currentCall = await getCurrentCall();
    log("currentCall ${currentCall}");
    if (currentCall != null) {
      Helper().showToast("Call accepted");
      int agoraUid = int.parse(currentCall['extra'][Keys.uid].toString());
      String token = currentCall['extra'][Keys.token];
      String channelName = currentCall['extra'][Keys.channelName];
      String callId = currentCall['extra'][Keys.callId];
      String receiverName = currentCall['extra'][Keys.receiverName];
      String receiverImage = currentCall['extra'][Keys.receiverImage];
      NavigationService.instance
          .pushNamedIfNotCurrent(Routes.voiceCallScreen, args: {
        'channelName': channelName,
        'remoteUid': agoraUid,
        'token': token,
        'callId': callId,
        'receiverName': receiverName,
        'receiverImage': receiverImage,
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => GetMaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
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
