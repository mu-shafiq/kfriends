class ChatRoom {
  String chatInitiator;
  List userIds;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? unreadCounts;
  String lastMsg;

  ChatRoom(
      {required this.chatInitiator,
      required this.userIds,
      this.id,
      this.createdAt,
      required this.lastMsg,
      this.unreadCounts,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      'chatInitiator': chatInitiator,
      'userIds': userIds,
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'unreadCounts': unreadCounts,
      'lastMsg': lastMsg,
    };
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      chatInitiator: json['chatInitiator'],
      userIds: json['userIds'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      unreadCounts: json['unreadCounts'],
      lastMsg: json['lastMsg'],
    );
  }
}
