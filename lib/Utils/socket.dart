import 'dart:developer';
import 'package:get/get.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Controllers/auth_controller.dart';
import 'package:kfriends/model/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';


class SocketNew {
  static Socket socket = IO.io(Keys.serverIP, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  static connectSocket() async {
    socket.io.options!['extraHeaders'] = {
      'client_id': Get.find<AuthController>().userModel!.id
    };
    socket.connect();

    socket.onConnect((data) {
      log('socket is now connected and listening to events $data');
    });

    socket.onError((error) {
      log('Connection Error -> $error');
    });
    socket.onDisconnect((data) => log('soket io server disconcted'));

    socket.on('new_message', (data) {
      log('new message received........');
    });
  }

  static sendMessageSocket(Message message) async {
    socket.emit('private_message', message.toJson());
  }

  static endCall(String id) async {
    socket.emit('end_call', id);
  }
}
