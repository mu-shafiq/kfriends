// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kfriends/model/call.dart';
import 'package:kfriends/model/user.dart';

class CallLogModel {
  String? id;
  String? userId;
  UserModel? contactId;
  CallModel? callId;
  String? type;
  CallLogModel({
    this.id,
    this.userId,
    this.contactId,
    this.callId,
    this.type,
  });

  CallLogModel copyWith({
    String? id,
    String? userId,
    UserModel? contactId,
    CallModel? callId,
    String? type,
  }) {
    return CallLogModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      contactId: contactId ?? this.contactId,
      callId: callId ?? this.callId,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'contactId': contactId?.toJson(),
      'callId': callId?.toMap(),
      'type': type,
    };
  }

  factory CallLogModel.fromMap(Map<String, dynamic> map) {
    return CallLogModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      contactId: map['contactId'] != null
          ? UserModel.fromJson(map['contactId'] as Map<String, dynamic>)
          : null,
      callId: map['callId'] != null
          ? CallModel.fromMap(map['callId'] as Map<String, dynamic>)
          : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallLogModel.fromJson(String source) =>
      CallLogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallLogModel(id: $id, userId: $userId, contactId: $contactId, callId: $callId, type: $type)';
  }

  @override
  bool operator ==(covariant CallLogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.contactId == contactId &&
        other.callId == callId &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        contactId.hashCode ^
        callId.hashCode ^
        type.hashCode;
  }
}
