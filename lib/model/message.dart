class Message {
  String senderId;
  String recieverId;
  String msg;
  int sort;
  String timeSent;
  String type;
  String? attachmentUrl;
  String chatRoomId;

  Message(
      {required this.senderId,
      required this.recieverId,
      required this.msg,
      required this.sort,
      required this.timeSent,
      this.attachmentUrl,
      required this.chatRoomId,
      required this.type});

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'reciever_id': recieverId,
      'msg': msg,
      'sort': sort,
      'time_sent': timeSent,
      'type': type,
      'attachment_url': attachmentUrl,
      'chatRoomId': chatRoomId
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        senderId: json['sender_id'],
        recieverId: json['reciever_id'],
        msg: json['msg'],
        sort: json['sort'],
        attachmentUrl: json['attachment_url'],
        type: json['type'],
        chatRoomId: json['chatRoomId'],
        timeSent: json['time_sent']);
  }
}
