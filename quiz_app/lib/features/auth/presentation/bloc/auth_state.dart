import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}





















// import 'package:equatable/equatable.dart';
// import 'package:quiz_app/features/auth/domain/entities/user.dart';

// abstract class AuthState extends Equatable {
//   const AuthState();

//   @override
//   List<Object?> get props => [];
// }

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthLoggedIn extends AuthState {
//   final User user;

//   const AuthLoggedIn({required this.user});

//   @override
//   List<Object?> get props => [user];
// }

// class AuthLoggedOut extends AuthState {}

// class AuthRegistered extends AuthState {}

// class AuthError extends AuthState {
//   final String message;

//   const AuthError({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
