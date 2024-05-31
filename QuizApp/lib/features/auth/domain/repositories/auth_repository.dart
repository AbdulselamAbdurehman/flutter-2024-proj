import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/features/auth/domain/entities/user.dart';

//abstract class to be implemented by AuthRepositoryImpl in data layer
abstract class AuthRepository {
  Future<Either<Failure, User>> loginUser(
      String userId, String password, String role);
}
