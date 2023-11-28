class Message {
  String senderId;
  String recieverId;
  String msg;
  int sort;
  DateTime timeSent;
  String type;
  String? attachmentUrl;

  Message(
      {required this.senderId,
      required this.recieverId,
      required this.msg,
      required this.sort,
      required this.timeSent,
      this.attachmentUrl,
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
        timeSent: json['time_sent']);
  }
}
