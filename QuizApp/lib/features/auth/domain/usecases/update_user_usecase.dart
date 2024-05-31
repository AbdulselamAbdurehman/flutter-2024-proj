// // lib/features/authentication/domain/usecases/update_user_usecase.dart

// import 'package:dartz/dartz.dart';
// import 'package:quiz_app/core/errors/failure.dart';
// import 'package:quiz_app/core/usecases/usecase.dart';
// import 'package:quiz_app/features/authentication/domain/entities/user.dart';
// import 'package:quiz_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/core/usecases/usecase.dart';
import 'package:learn/features/auth/domain/entities/user.dart';
import 'package:learn/features/auth/domain/repositories/auth_repository.dart';

class UpdateUserUsecase implements UseCase<User, UpdateUserParams> {
  final AuthRepository repository;
  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateUserParams params) {
    // TODO: implement update user
    throw UnimplementedError();
  }
}

// class UpdateUserUseCase implements UseCase<User, UpdateUserParams> {
//   final AuthRepository repository;

//   UpdateUserUseCase(this.repository);

//   @override
//   Future<Either<Failure, User>> call(UpdateUserParams params) async {
//     // Assuming the repository has a method to update user information
//     return await repository.updateUser(
//       params.userId,
//       params.newUsername,
//       params.newEmail,
//       params.newPassword,
//     );
//   }
// }

class UpdateUserParams {
  final String userId;
  final String newUsername;
  final String newEmail;
  final String newPassword;

  UpdateUserParams({
    required this.userId,
    required this.newUsername,
    required this.newEmail,
    required this.newPassword,
  });
}
