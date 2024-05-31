// lib/features/authentication/presentation/bloc/auth_event.dart
import 'package:equatable/equatable.dart';

part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String userId;
  final String password;
  final String role;

  const LoginEvent({
    required this.userId,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [userId, password, role];
}

class LogoutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String role;

  const RegisterEvent({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [username, password, email, role];
}

class UpdateUserEvent extends AuthEvent {
  final String userId;
  final String newUsername;
  final String newEmail;
  final String newPassword;

  const UpdateUserEvent({
    required this.userId,
    required this.newUsername,
    required this.newEmail,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [userId, newUsername, newEmail, newPassword];
}
