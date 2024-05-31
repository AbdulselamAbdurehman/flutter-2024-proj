import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_password_usecase.dart';

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

class SignupEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String role;

  const SignupEvent({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [username, password, email, role];
}

class LogoutEvent extends AuthEvent {}

class UpdatePasswordEvent extends AuthEvent {
  final UpdatePasswordParams params;

  const UpdatePasswordEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class UpdateUsernameEvent extends AuthEvent {
  final String newUsername;

  const UpdateUsernameEvent({required this.newUsername});

  @override
  List<Object?> get props => [newUsername];
}
