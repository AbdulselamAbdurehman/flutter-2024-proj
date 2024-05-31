import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';

class SignupParams extends Equatable {
  final String username;
  final String password;
  final String email;
  final String role;

  const SignupParams({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [username, password, email, role];
}

class Signup {
  final AuthRepository repository;

  Signup(this.repository);

  Future<Either<Failure, Success>> call(SignupParams params) async {
    return await repository.signup(
        username: params.username,
        password: params.password,
        email: params.email,
        role: params.role);
  }
}
