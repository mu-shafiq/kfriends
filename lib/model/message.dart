class Message {
  String? senderId;
  String recieverId;
  String msg;
  int sort;

  Message({
    this.senderId,
    required this.recieverId,
    required this.msg,
    required this.sort,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'reciever_id': recieverId,
      'msg': msg,
      'sort': sort,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['sender_id'],
      recieverId: json['reciever_id'],
      msg: json['msg'],
      sort: json['sort'],
    );
  }
}
