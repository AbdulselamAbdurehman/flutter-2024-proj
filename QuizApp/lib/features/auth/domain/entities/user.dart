import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String email;
  final String role;

  const User({
    required this.username,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [username, email, role];
}
