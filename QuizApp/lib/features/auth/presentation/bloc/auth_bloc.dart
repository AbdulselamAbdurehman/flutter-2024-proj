// lib/features/authentication/presentation/bloc/auth_bloc.dart

// import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:learn/features/auth/domain/usecases/login_usecase.dart';
import 'package:learn/features/auth/domain/usecases/logout_usecase.dart';
import 'package:learn/features/auth/domain/usecases/register_usecase.dart';
import 'package:learn/features/auth/domain/usecases/update_user_usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:learn/features/auth/domain/entities/user.dart';
// import 'package:quiz_app/core/errors/failure.dart';
// import 'package:quiz_app/features/authentication/domain/entities/user.dart';
// import 'package:quiz_app/features/authentication/domain/usecases/login_usecase.dart';
// import 'package:quiz_app/features/authentication/domain/usecases/logout_usecase.dart';
// import 'package:quiz_app/features/authentication/domain/usecases/register_usecase.dart';
// import 'package:quiz_app/features/authentication/domain/usecases/update_user_usecase.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';
import 'package:learn/features/auth/presentation/bloc/auth_event.dart';
import 'package:learn/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final RegisterUsecase registerUsecase;
  final UpdateUserUsecase updateUserUsecase;

  AuthBloc({
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.registerUsecase,
    required this.updateUserUsecase,
  }) : super(AuthInitial());
}

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final LoginUseCase loginUseCase;
//   final LogoutUseCase logoutUseCase;
//   final RegisterUseCase registerUseCase;
//   final UpdateUserUseCase updateUserUseCase;

//   AuthBloc({
//     required this.loginUseCase,
//     required this.logoutUseCase,
//     required this.registerUseCase,
//     required this.updateUserUseCase,
//   }) : super(AuthInitial());

//   @override
//   Stream<AuthState> mapEventToState(
//     AuthEvent event,
//   ) async* {
//     if (event is LoginEvent) {
//       yield* _mapLoginEventToState(event);
//     } else if (event is LogoutEvent) {
//       yield* _mapLogoutEventToState(event);
//     } else if (event is RegisterEvent) {
//       yield* _mapRegisterEventToState(event);
//     } else if (event is UpdateUserEvent) {
//       yield* _mapUpdateUserEventToState(event);
//     }
//   }

//   Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
//     yield AuthLoading();
//     final result = await loginUseCase(event.userId, event.password, event.role);
//     yield result.fold(
//       (failure) => AuthError(message: _mapFailureToMessage(failure)),
//       (user) => AuthAuthenticated(user: user),
//     );
//   }

//   Stream<AuthState> _mapLogoutEventToState(LogoutEvent event) async* {
//     yield AuthLoading();
//     final result = await logoutUseCase(NoParams());
//     yield result.fold(
//       (failure) => AuthError(message: _mapFailureToMessage(failure)),
//       (_) => AuthUnauthenticated(),
//     );
//   }

//   Stream<AuthState> _mapRegisterEventToState(RegisterEvent event) async* {
//     yield AuthLoading();
//     final result = await registerUseCase(
//       RegisterParams(
//         username: event.username,
//         password: event.password,
//         email: event.email,
//         role: event.role,
//       ),
//     );
//     yield result.fold(
//       (failure) => AuthError(message: _mapFailureToMessage(failure)),
//       (user) => AuthRegistered(),
//     );
//   }

//   Stream<AuthState> _mapUpdateUserEventToState(UpdateUserEvent event) async* {
//     yield AuthLoading();
//     final result = await updateUserUseCase(
//       UpdateUserParams(
//         userId: event.userId,
//         newUsername: event.newUsername,
//         newEmail: event.newEmail,
//         newPassword: event.newPassword,
//       ),
//     );
//     yield result.fold(
//       (failure) => AuthError(message: _mapFailureToMessage(failure)),
//       (user) => AuthUpdated(),
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     return failure.message;
//   }
// }
