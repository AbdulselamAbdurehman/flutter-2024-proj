// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:quiz_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl(
      {required this.authRemoteDataSource, required this.authLocalDataSource});

  @override
  Future<Either<Failure, Success>> login(
      {required String userId,
      required String password,
      required String role}) {
    print(
        'from auth repository impl: userId = $userId, password = $password, role = $role');
    return authRemoteDataSource.login(userId, password, role);
  }

  @override
  Future<void> logout() {
    return authLocalDataSource.clearToken();
  }

  @override
  Future<Either<Failure, Success>> signup(
      {required String username,
      required String password,
      required String email,
      required String role}) {
    return authRemoteDataSource.signup(username, password, email, role);
  }

  @override
  Future<Either<Failure, Success>> updatePassword(
      {required String oldPassword, required String newPassword}) {
    return authRemoteDataSource.updatePassword(oldPassword, newPassword);
  }

  @override
  Future<Either<Failure, Success>> updateUsername(
      {required String newUsername}) {
    return authRemoteDataSource.updateUsername(newUsername);
  }

  @override
  Future<Either<Failure, Success>> deleteUser() {
    return authRemoteDataSource.deleteUser();
  }
}
