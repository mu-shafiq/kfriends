class Thinking {
  String? id;
  String userId;
  String userName;
  String userImage;
  bool verified;
  String content;
  List files;
  List? comments;
  List? likes;
  String? createdAt;
  String? updatedAt;

  Thinking(
      {this.id,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.verified,
      required this.content,
      required this.files,
      this.comments,
      this.likes,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'verified': verified,
      'content': content,
      'files': files,
      'comments': comments,
      'likes': likes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userName': userName,
      'userImage': userImage
    };
  }

  factory Thinking.fromJson(Map<String, dynamic> json) {
    return Thinking(
        id: json['_id'],
        userId: json['userId'],
        verified: json['verified'],
        content: json['content'],
        files: json['files'] ?? [],
        likes: json['likes'] ?? [],
        comments: json['comments'] ?? [],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        userName: json['userName'],
        userImage: json['userImage']);
  }
}
