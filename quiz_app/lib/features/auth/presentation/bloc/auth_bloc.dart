// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_username_usecase.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_state.dart';

// BLoC for managing authentication states and events
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Signup signUp;
  final Logout logout;
  final UpdatePassword updatePassword;
  final UpdateUsername updateUsername;
  final DeleteUser deleteUser;

  AuthBloc(
      {required this.login,
      required this.logout,
      required this.signUp,
      required this.updatePassword,
      required this.updateUsername,
      required this.deleteUser})
      : super(AuthInitial()) {
    on<LoginEvent>(_onAuthLogin);
    on<SignupEvent>(_onAuthSignup);
    on<LogoutEvent>(_onAuthLogout);
    on<UpdatePasswordEvent>(_onAuthUpdatePassword);
    on<UpdateUsernameEvent>(_onAuthUpdateUsername);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  // Event handler for user login
  void _onAuthLogin(LoginEvent event, Emitter<AuthState> emit) async {
    print(
        'from login event handler: userId = ${event.userId}, password = ${event.password}, role = ${event.role}');
    emit(AuthLoading());
    final result = await login(LoginParams(
        userId: event.userId, password: event.password, role: event.role));
    result.fold(
      (failure) => emit(AuthFailure('Login failed')),
      (success) => emit(AuthSuccess('Login successful')),
    );
  }

  // Event handler for user signup
  void _onAuthSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signUp(SignupParams(
        username: event.username,
        password: event.password,
        email: event.email,
        role: event.role));

    result.fold((failure) => emit(AuthFailure('Sign Up Failed')),
        (success) => emit(AuthSuccess('Sign Up Successful')));
  }

  // Event handler for user logout
  void _onAuthLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await logout();
    emit(AuthSuccess('Logged out successfully'));
  }

  // Event handler for updating user password
  void _onAuthUpdatePassword(
      UpdatePasswordEvent event, Emitter<AuthState> emit) async {
    final result = await updatePassword(UpdatePasswordParams(
        newPassword: event.params.newPassword,
        oldPassword: event.params.oldPassword));
    result.fold((failure) => emit(AuthFailure('Password Update Unsuccessful')),
        (success) => emit(AuthSuccess('Update Successful')));
  }

  // Event handler for updating username
  void _onAuthUpdateUsername(
      UpdateUsernameEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await updateUsername(event.newUsername);
    result.fold((failure) => emit(AuthFailure('Update Unsuccessful')),
        (success) => emit(AuthSuccess('Update Successful')));
  }

  // Event handler for deleting user account
  void _onDeleteUser(DeleteUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await deleteUser();
    result.fold((failure) => emit(AuthFailure('Request Unsuccessful')),
        (success) => emit(AuthSuccess('We\'re sorry to see you go')));
  }
}
