// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<LogoutEvent>(_onLogout);
    on<UpdatePasswordEvent>(_onUpdatePassword);
    on<UpdateUsernameEvent>(_onUpdateUsername);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.login(
      userId: event.userId,
      password: event.password,
      role: event.role,
    );
    result.fold(
      (failure) => emit(AuthFailure('Login failed')),
      (success) => emit(AuthSuccess('Login successful')),
    );
  }

  void _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signup(
      username: event.username,
      password: event.password,
      email: event.email,
      role: event.role,
    );
    result.fold(
      (failure) => emit(AuthFailure('Signup failed')),
      (success) => emit(AuthSuccess('Signup successful')),
    );
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    repository.logout();
    // Perform logout logic here, then emit success or failure
    emit(AuthSuccess('Logged out successfully'));
  }

  void _onUpdatePassword(
      UpdatePasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await repository.updatePassword(
        oldPassword: event.params.oldPassword,
        newPassword: event.params.newPassword);
    result.fold(
      (failure) => emit(AuthFailure('Password update failed')),
      (success) => emit(AuthSuccess('Password updated successfully')),
    );
  }

  void _onUpdateUsername(
      UpdateUsernameEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result =
        await repository.updateUsername(newUsername: event.newUsername);
    result.fold(
      (failure) => emit(AuthFailure('Username update failed')),
      (success) => emit(AuthSuccess('Username updated successfully')),
    );
  }
}



// import 'dart:async';
// // ignore: depend_on_referenced_packages
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:quiz_app/core/errors/failures.dart';
// // import 'package:quiz_app/features/auth/domain/entities/user.dart';
// import 'package:quiz_app/features/auth/domain/usecases/login_usecase.dart';
// import 'package:quiz_app/features/auth/domain/usecases/signup_usecase.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final Login login;
//   final Signup signup;

//   AuthBloc({
//     required this.login,
//     required this.signup,
//   }) : super(AuthInitial());

//   Stream<AuthState> mapEventToState(
//     AuthEvent event,
//   ) async* {
//     if (event is LoginButtonPressed) {
//       yield AuthLoading();
//       // yield* _eitherLoginOrErrorState(result);
//     } else if (event is SignupButtonPressed) {
//       yield AuthLoading();
//       final result = await signup(SignupParams(
//         username: event.username,
//         password: event.password,
//         email: event.email,
//         role: event.role,
//       ));
//       yield* _eitherSignupOrErrorState(result);
//     } else if (event is LogoutButtonPressed) {
//       // await logout();

//       yield AuthLoggedOut();
//     }
//   }

//   Stream<AuthState> _eitherSignupOrErrorState(
//     Either<Failure, void> result,
//   ) async* {
//     yield result.fold(
//       (failure) => AuthError(message: _mapFailureToMessage(failure)),
//       (_) => AuthRegistered(),
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure _:
//         return 'Server Failure';
//       case CacheFailure _:
//         return 'Cache Failure';
//       default:
//         return 'Unexpected Error';
//     }
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quiz_app/features/auth/presentation/bloc/auth_event.dart';
// import 'package:quiz_app/features/auth/presentation/bloc/auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState>{
  
// }