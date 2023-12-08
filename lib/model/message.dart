class Message {
  String? id;
  String senderId;
  String receiverId;
  String msg;
  int sort;
  String timeSent;
  String type;
  String? attachmentUrl;
  String chatRoomId;
  List readBy;

  Message(
      {required this.senderId,
      required this.receiverId,
      required this.msg,
      required this.sort,
      required this.timeSent,
      this.attachmentUrl,
      required this.chatRoomId,
      required this.type,
      required this.readBy,
      this.id});

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'msg': msg,
      'sort': sort,
      'time_sent': timeSent,
      'type': type,
      'attachment_url': attachmentUrl,
      'chatRoomId': chatRoomId,
      'readBy': readBy,
      'id': id,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      msg: json['msg'],
      sort: json['sort'],
      attachmentUrl: json['attachment_url'],
      type: json['type'],
      chatRoomId: json['chatRoomId'],
      timeSent: json['time_sent'],
      readBy: json['readBy'],
      id: json['_id'],
    );
  }
}
