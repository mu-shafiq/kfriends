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
    _initializeFirebaseMessaging();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.toNamed(Routes.loginScreen);
    });
  }

  // Initialize Firebase Messaging
  void _initializeFirebaseMessaging() {
    FirebaseMessaging.instance.requestPermission();

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming messages
      _handleIncomingMessage(message);
    });

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Handle incoming message
  Future<void> _handleIncomingMessage(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (message.data['type'] == 'call') {
      // Handle incoming call
      _handleIncomingCall(message);
    }
  }

  // Background message handler
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    if (message.data['type'] == 'call') {
      _handleIncomingCall(message);
    }
  }

  // Handle incoming call
  static Future<void> _handleIncomingCall(RemoteMessage message) async {
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
      extra: <String, dynamic>{"userId": "1a2b3c4d"},
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
    callListener(message);

    try {
      log("ffff 9");

      await FlutterCallkitIncoming.showCallkitIncoming(params);
      log("ffff 10");

      // await FlutterCallkitIncoming.startCall(params);
    } catch (e) {
      log("Error displaying incoming call: $e");
    }
  }

  static void callListener(RemoteMessage message) {
    log("ffff 11");

    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
      switch (event!.event) {
        case Event.actionCallIncoming:
          log("Incoming call");
          Helper().showToast("Incoming call");
          // TODO: received an incoming call
          break;
        case Event.actionCallStart:
          Helper().showToast("Call started");
          // TODO: started an outgoing call
          // TODO: show screen calling in Flutter
          break;
        case Event.actionCallAccept:
          Helper().showToast("Call accepted");
          int agoraUid = int.parse(message.data[Keys.uid].toString());
          String token = message.data[Keys.token];
          String channelName = message.data[Keys.channelName];
          String callId = message.data[Keys.callId];
          String receiverName = message.data[Keys.receiverName];
          String receiverImage = message.data[Keys.receiverImage];
          navigatorKey.currentState!.pushNamed(
            Routes.voiceCallScreen,
            arguments: {
              'channelName': channelName,
              'remoteUid': agoraUid,
              'token': token,
              'callId': callId,
              'receiverName': receiverName,
              'receiverImage': receiverImage,
            },
          );
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   Get.toNamed(Routes.callScreen);
          // });
          // TODO: accepted an incoming call
          // TODO: show screen calling in Flutter
          break;
        case Event.actionCallDecline:
          Helper().showToast("Call declined");
          // TODO: declined an incoming call
          break;
        case Event.actionCallEnded:
          Helper().showToast("Call ended");
          // TODO: ended an incoming/outgoing call
          break;
        case Event.actionCallTimeout:
          Helper().showToast("Call timeout");
          // TODO: missed an incoming call
          break;
        case Event.actionCallCallback:

          // TODO: only Android - click action `Call back` from missed call notification
          break;
        case Event.actionCallToggleHold:
          // TODO: only iOS
          break;
        case Event.actionCallToggleMute:
          // TODO: only iOS
          break;
        case Event.actionCallToggleDmtf:
          // TODO: only iOS
          break;
        case Event.actionCallToggleGroup:
          // TODO: only iOS
          break;
        case Event.actionCallToggleAudioSession:
          // TODO: only iOS
          break;
        case Event.actionDidUpdateDevicePushTokenVoip:
          // TODO: only iOS
          break;
        case Event.actionCallCustom:
          // TODO: for custom action
          break;
      }
    });
  }

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
