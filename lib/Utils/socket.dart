import 'dart:developer';
import 'package:kfriends/Utils/keys.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketNew {
  static Socket socket = IO.io('${Keys.localHostIP}:3000', <String, dynamic>{
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

    socket.on('new_message', (data) {
      log('new message recieved........');
    });
  }

  static sendMessageSocket(
    userid,
    text,
  ) async {
    socket.emit('private_message', {
      'reciever_id': 'vvgiL5juitxseeebcv',
      'my_id': 'vvgiL5juitxseeeb',
      'msg': text,
      'sort': DateTime.now().microsecondsSinceEpoch,
    });
  }
}
