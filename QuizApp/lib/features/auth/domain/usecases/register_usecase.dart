import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/core/usecases/usecase.dart';
import 'package:learn/features/auth/domain/entities/user.dart';
import 'package:learn/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) {
    // TODO: implement register use case in abstract repository
    throw UnimplementedError();
  }
}

// class RegisterUseCase implements UseCase<User, RegisterParams> {
//   final AuthRepository repository;

//   RegisterUseCase(this.repository);

//   @override
//   Future<Either<Failure, User>> call(RegisterParams params) async {
//    throw Unim
//     // Assuming the repository has a method to register a user
//     // return await repository.registerUser(
//     //   params.username,
//     //   params.password,
//     //   params.email,
//     //   params.role,
//     // );
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:learn/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}


class RegisterParams {
  final String username;
  final String password;
  final String email;
  final String role;

  RegisterParams({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });
}
