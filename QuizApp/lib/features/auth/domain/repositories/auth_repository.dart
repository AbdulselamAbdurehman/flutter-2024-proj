import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginUser(
      String userId, String password, String role);
}
