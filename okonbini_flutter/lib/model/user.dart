class User {
  String userName;
  String description;
  String profileImageUrl;
  String location;
  DateTime dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  User({
    required this.userName,
    required this.description,
    required this.profileImageUrl,
    required this.location,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  // JSON から User インスタンスを作成する
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['user_name'],
      description: json['description'],
      profileImageUrl: json['profile_image_url'],
      location: json['location'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  // User インスタンスを JSON に変換する
  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'description': description,
      'profile_image_url': profileImageUrl,
      'location': location,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

  // 文字列に変換する
  @override
  String toString() {
    return 'User(userName: $userName, description: $description, profileImageUrl: $profileImageUrl, location: $location, dateOfBirth: $dateOfBirth, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}
