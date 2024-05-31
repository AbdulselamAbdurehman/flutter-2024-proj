import 'package:quiz_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.username,
    required super.password,
    required super.email,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'role': role,
    };
  }
}
