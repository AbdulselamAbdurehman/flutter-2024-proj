import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String password;
  final String email;
  final String role;

  const User({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [username, password, email, role];
}
