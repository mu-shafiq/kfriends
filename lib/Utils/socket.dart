import 'dart:developer';

import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketNew {
  static Socket socket = IO.io('${Keys.serverIP}:3000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  static connectSocket() async {
    socket.io.options!['extraHeaders'] = {'client_id': 'vvgiL5juitxseeebcv'};
    socket.connect();

    socket.onConnect((data) {
      log('socket is now connected and listening to events $data');
    });

    socket.onError((error) {
      log('Connection Error -> $error');
    });
    socket.onDisconnect((data) => log('soket io server disconcted'));

    socket.on('private_message', (data) {
      log('new message recieved........');
    });
  }

  static sendMessageSocket(
    userid,
    text,
  ) async {
    socket.emit('private_message', {
      'reciever_id': userid,
      'my_id': userid,
      'msg': text,
      'sort': DateTime.now().microsecondsSinceEpoch,
    });
  }
}
