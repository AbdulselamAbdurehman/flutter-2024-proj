import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';

class LoginParams extends Equatable {
  final String userId;
  final String password;
  final String role;

  const LoginParams({
    required this.userId,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [userId, password, role];
}

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, Success>> call(LoginParams params) async {
    return await repository.login(
        userId: params.userId, password: params.password, role: params.role);
  }
}
