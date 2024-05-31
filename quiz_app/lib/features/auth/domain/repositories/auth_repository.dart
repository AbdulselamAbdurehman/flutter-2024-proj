import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';

abstract class AuthRepository {
  Future<Either<Failure, Success>> login(
      {required String userId, required String password, required String role});

  Future<Either<Failure, Success>> signup(
      {required String username,
      required String password,
      required String email,
      required String role});

  Future<void> logout();

  Future<Either<Failure, Success>> updateUsername(
      {required String newUsername});

  Future<Either<Failure, Success>> updatePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<Failure, Success>> deleteUser();
}
