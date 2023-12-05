class Post {
  String? id;
  String userId;
  String userName;
  String userImage;
  String interest;
  String title;
  String content;
  List files;
  List? comments;
  List? likes;
  String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.interest,
      required this.title,
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
      'interest': interest,
      'title': title,
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

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['_id'],
        userId: json['userId'],
        interest: json['interest'],
        title: json['title'],
        content: json['content'],
        files: json['files'] ?? [],
        likes: json['likes'],
        comments: json['comments'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        userName: json['userName'],
        userImage: json['userImage']);
  }
}
