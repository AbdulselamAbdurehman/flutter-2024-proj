import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/core/usecases/usecase.dart';
import 'package:learn/features/auth/domain/entities/user.dart';
import 'package:learn/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    // return await repository.loginUser(params.userId, params.password, params.role);
    throw UnimplementedError();
  }
}

class LoginParams {
  final String userId;
  final String password;
  final String role;

  LoginParams({
    required this.userId,
    required this.password,
    required this.role,
  });
}

abstract class A {
  Future<Either<Failure, User>> call(LoginParams params);
}
