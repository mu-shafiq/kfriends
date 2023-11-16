// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:kfriends/Utils/constants.dart';
// import 'package:kfriends/Utils/helper.dart';
// import 'package:permission_handler/permission_handler.dart';

// class VoiceCallScreen extends StatefulWidget {
//   final String channelName;
//   final String token;
//   final int uid;

//   const VoiceCallScreen(
//       {Key? key,
//       required this.channelName,
//       required this.token,
//       required this.uid})
//       : super(key: key);

//   @override
//   _VoiceCallScreenState createState() => _VoiceCallScreenState();
// }

// class _VoiceCallScreenState extends State<VoiceCallScreen> {
//   late RtcEngine _engine;
//   bool _isMuted = false;

//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   Future<void> initAgora() async {
//     await [Permission.microphone].request();

//     // Create Agora Engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(const RtcEngineContext(
//       appId: agoraAppID,
//     ));
//     await _engine.enableAudio();
//     await _engine.joinChannel(
//       token:
//           "007eJxTYLhSeXxWc0aH8mTfclfxad7Tvgc/3yD8ZuUih/Ar6YvaXu5WYEgyTkwyNDAzMjVISTUxN0q1NDQ3MrWwSDE2NjQ0SU409DgWktoQyMjgK63EzMgAgSA+F0NIRqpzRmJeXmoOAwMAVGYhdg==",
//       channelId: "TheChannel",
//       options: const ChannelMediaOptions(
//           channelProfile: ChannelProfileType.channelProfileCommunication),
//       uid: 0,
//     );

//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("ffff local user ${connection.localUid} joined");
//           Helper().showToast("local user ${connection.localUid} joined");
//           // setState(() {
//           //   _localUserJoined = true;
//           // });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("ffff remote user $remoteUid joined");
//           Helper().showToast("remote user $remoteUid joined");
//           // setState(() {
//           //   _remoteUid = remoteUid;
//           // });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("ffff remote user $remoteUid left channel");
//           Helper().showToast("remote user $remoteUid left channel");
//           // setState(() {
//           //   _remoteUid = null;
//           // });
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }

//   void _onToggleMute() {
//     setState(() {
//       _isMuted = !_isMuted;
//     });
//     _engine.muteLocalAudioStream(_isMuted);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Voice Call'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Channel: ${widget.channelName}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Uid: ${widget.uid}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             IconButton(
//               icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
//               onPressed: _onToggleMute,
//               tooltip: 'Mute/Unmute',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kfriends/Utils/constants.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

class VoiceCallScreen extends StatefulWidget {
  final String channelName;
  final String token;
  final int uid;
  const VoiceCallScreen(
      {super.key,
      required this.channelName,
      required this.token,
      required this.uid});

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  String testToken =
      "007eJxTYLhSeXxWc0aH8mTfclfxad7Tvgc/3yD8ZuUih/Ar6YvaXu5WYEgyTkwyNDAzMjVISTUxN0q1NDQ3MrWwSDE2NjQ0SU409DgWktoQyMjgK63EzMgAgSA+F0NIRqpzRmJeXmoOAwMAVGYhdg==";

  int? _remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine agoraEngine; // Agora engine instance

  late StreamSubscription<dynamic> _proximitySubscription;
  bool _isNear = false;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold

  showMessage(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    super.initState();
    // Set up an instance of Agora engine
    setupVoiceSDKEngine();
    _initProximitySensor();
  }

  Future<void> setupVoiceSDKEngine() async {
    // retrieve or request microphone permission
    await [Permission.microphone].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: agoraAppID));

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          showMessage(
              "Local user uid:${connection.localUid} joined the channel");
          setState(() {
            _isJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          showMessage("Remote user uid:$remoteUid joined the channel");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          showMessage("Remote user uid:$remoteUid left the channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );
  }

  void _initProximitySensor() {
    _proximitySubscription = ProximitySensor.events.listen((int event) {
      print("Proximity sensor event: $event");
      if (_isJoined && _remoteUid != null) {
        setState(() {
          _isNear = (event > 0) ? true : false;
          // Switch between earpiece and loudspeaker based on proximity sensor
          agoraEngine.setEnableSpeakerphone(!_isNear);
        });
      }
    });
  }

  void join() async {
    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: testToken,
      channelId: widget.channelName,
      options: options,
      uid: widget.uid,
    );
  }

  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    agoraEngine.leaveChannel();
  }

  @override
  void dispose() {
    agoraEngine.leaveChannel();
    agoraEngine.release();
    _proximitySubscription.cancel();
    super.dispose();
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get started with Voice Calling'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: [
          // Status text
          SizedBox(
              height: 40, child: Center(child: Text("UId : ${widget.uid}"))),
          SizedBox(height: 40, child: Center(child: _status())),
          // Button Row
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  child: const Text("Join"),
                  onPressed: () => {join()},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  child: const Text("Leave"),
                  onPressed: () => {leave()},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _status() {
    String statusText;

    if (!_isJoined) {
      statusText = 'Join a channel';
    } else if (_remoteUid == null)
      statusText = 'Waiting for a remote user to join...';
    else
      statusText = 'Connected to remote user, uid:$_remoteUid';

    return Text(
      statusText,
    );
  }
}
