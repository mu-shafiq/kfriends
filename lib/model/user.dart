import 'package:intl/intl.dart';

class UserModel {
  String profileImage;
  String featuredImage;
  String username;
  String email;
  String password;
  String gender;
  DateTime dateOfBirth;
  String? job; // Optional
  String? country; // Optional
  String? region; // Optional
  String englishProficiency;
  String koreanProficiency;
  List<String>? interests; // Optional
  String? universityName; // Optional
  String? intro; // Optional
  String userType;
  List<String> followers;
  List<String> following;
  List<String> callLogs;

  UserModel({
    required this.profileImage,
    required this.featuredImage,
    required this.username,
    required this.email,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    this.job,
    this.country,
    this.region,
    this.englishProficiency = "beginner",
    this.koreanProficiency = "beginner",
    this.interests,
    this.universityName,
    this.intro,
    required this.userType,
    required this.followers,
    required this.following,
    required this.callLogs,
  });

  int get age {
    final today = DateTime.now();
    int age = today.year - dateOfBirth.year;
    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  Map<String, dynamic> toJson() {
    return {
      'profileImage': profileImage,
      'featuredImage': featuredImage,
      'username': username,
      'email': email,
      'password': password,
      'gender': gender,
      'dateOfBirth': DateFormat('yyyy-MM-dd').format(
          dateOfBirth), // Assuming you want to send it as a string in this format
      'job': job,
      'country': country,
      'region': region,
      'englishProficiency': englishProficiency,
      'koreanProficiency': koreanProficiency,
      'interests': interests,
      'universityName': universityName,
      'intro': intro,
      'userType': userType,
      'followers': followers,
      'following': following,
      'callLogs': callLogs,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profileImage: json['profileImage'],
      featuredImage: json['featuredImage'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      job: json['job'],
      country: json['country'],
      region: json['region'],
      englishProficiency: json['englishProficiency'] ?? "beginner",
      koreanProficiency: json['koreanProficiency'] ?? "beginner",
      interests: List<String>.from(json['interests'] ?? []),
      universityName: json['universityName'],
      intro: json['intro'],
      userType: json['userType'],
      followers: List<String>.from(json['followers'] ?? []),
      following: List<String>.from(json['following'] ?? []),
      callLogs: List<String>.from(json['callLogs'] ?? []),
    );
  }
}
