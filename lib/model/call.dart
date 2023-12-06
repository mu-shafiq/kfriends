import 'dart:convert';

class CallModel {
  String? id;
  String? caller;
  String? receiver;
  int? callerUid;
  int? receiverUid;
  DateTime? startAt;
  DateTime? endAt;
  String? channelName;
  String? status;
  String? type;
  Duration? duration;
  CallModel({
    this.id,
    this.caller,
    this.receiver,
    this.callerUid,
    this.receiverUid,
    this.startAt,
    this.endAt,
    this.channelName,
    this.status,
    this.type,
    this.duration,
  });

  CallModel copyWith({
    String? id,
    String? caller,
    String? receiver,
    int? callerUid,
    int? receiverUid,
    DateTime? startAt,
    DateTime? endAt,
    String? channelName,
    String? status,
    String? type,
    Duration? duration,
  }) {
    return CallModel(
      id: id ?? this.id,
      caller: caller ?? this.caller,
      receiver: receiver ?? this.receiver,
      callerUid: callerUid ?? this.callerUid,
      receiverUid: receiverUid ?? this.receiverUid,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      channelName: channelName ?? this.channelName,
      status: status ?? this.status,
      type: type ?? this.type,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caller': caller,
      'receiver': receiver,
      'callerUid': callerUid,
      'receiverUid': receiverUid,
      'startAt': startAt?.millisecondsSinceEpoch,
      'endAt': endAt?.millisecondsSinceEpoch,
      'channelName': channelName,
      'status': status,
      'type': type,
      'duration': duration?.inSeconds,
    };
  }

  factory CallModel.fromMap(Map<String, dynamic> map) {
    return CallModel(
        id: map['id'] != null ? map['id'] as String : null,
        caller: map['caller'] != null ? map['caller'] as String : null,
        receiver: map['receiver'] != null ? map['receiver'] as String : null,
        callerUid: map['callerUid'] != null ? map['callerUid'] as int : null,
        receiverUid:
            map['receiverUid'] != null ? map['receiverUid'] as int : null,
        startAt: map['startAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                int.tryParse(map['startAt']) ?? 0)
            : null,
        endAt: map['endAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['endAt'] as int)
            : null,
        channelName:
            map['channelName'] != null ? map['channelName'] as String : null,
        status: map['status'] != null ? map['status'] as String : null,
        type: map['type'] != null ? map['type'] as String : null,
        duration: Duration(
            seconds: map['duration'] != null ? map['duration'] as int : 0));
  }

  String toJson() => json.encode(toMap());

  factory CallModel.fromJson(String source) =>
      CallModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Call(id: $id, caller: $caller, receiver: $receiver, callerUid: $callerUid, receiverUid: $receiverUid, startAt: $startAt, endAt: $endAt, channelName: $channelName, status: $status, type: $type, duration: $duration)';
  }

  @override
  bool operator ==(covariant CallModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.caller == caller &&
        other.receiver == receiver &&
        other.callerUid == callerUid &&
        other.receiverUid == receiverUid &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        other.channelName == channelName &&
        other.status == status &&
        other.type == type &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        caller.hashCode ^
        receiver.hashCode ^
        callerUid.hashCode ^
        receiverUid.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        channelName.hashCode ^
        status.hashCode ^
        type.hashCode ^
        duration.hashCode;
  }
}
