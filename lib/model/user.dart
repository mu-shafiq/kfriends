import 'package:intl/intl.dart';

class UserModel {
  String? id;
  String profileImage;
  String featuredImage;
  String nickname;
  String email;
  String password;
  String gender;
  DateTime dateOfBirth;
  String? job;
  String? country;
  String? region;
  int? age;
  String englishProficiency;
  String koreanProficiency;
  List<String>? interests;
  String? universityName;
  String? intro;
  String userType;
  List<String> followers;
  List<String> following;
  List<String> callLogs;
  List<String> contacts;
  String fcmToken;
  int? agoraUid;

  UserModel({
    this.id,
    required this.profileImage,
    required this.featuredImage,
    required this.nickname,
    required this.email,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    this.job,
    this.country,
    this.region,
    this.age,
    this.englishProficiency = "beginner",
    this.koreanProficiency = "beginner",
    this.interests,
    this.universityName,
    this.intro,
    required this.userType,
    required this.followers,
    required this.following,
    required this.callLogs,
    required this.contacts,
    this.fcmToken = "",
    this.agoraUid,
  });

  Map<String, dynamic> toJson() {
    return {
      'profileImage': profileImage,
      'featuredImage': featuredImage,
      'nickname': nickname,
      'email': email,
      'password': password,
      'gender': gender,
      'dateOfBirth': DateFormat('yyyy-MM-dd').format(dateOfBirth),
      'job': job,
      'country': country,
      'region': region,
      'age': age,
      'englishProficiency': englishProficiency,
      'koreanProficiency': koreanProficiency,
      'interests': interests,
      'universityName': universityName,
      'intro': intro,
      'userType': userType,
      'followers': followers,
      'following': following,
      'callLogs': callLogs,
      'contacts': contacts,
      'fcmToken': fcmToken,
      'agoraUid': agoraUid,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      profileImage: json['profileImage'],
      featuredImage: json['featuredImage'],
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      job: json['job'],
      country: json['country'],
      region: json['region'],
      age: json['age'],
      englishProficiency: json['englishProficiency'] ?? "beginner",
      koreanProficiency: json['koreanProficiency'] ?? "beginner",
      interests: List<String>.from(json['interests'] ?? []),
      universityName: json['universityName'],
      intro: json['intro'],
      userType: json['userType'],
      followers: List<String>.from(json['followers'] ?? []),
      following: List<String>.from(json['following'] ?? []),
      callLogs: List<String>.from(json['callLogs'] ?? []),
      contacts: List<String>.from(json['contacts'] ?? []),
      fcmToken: json['fcmToken'] ?? "",
      agoraUid: json['agoraUid'],
    );
  }
}
