import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';

class UpdatePasswordParams extends Equatable {
  final String newPassword;
  final String oldPassword;

  const UpdatePasswordParams(
      {required this.newPassword, required this.oldPassword});

  @override
  List<Object?> get props => [oldPassword, newPassword];
}

class UpdatePassword {
  final AuthRepository repository;
  UpdatePassword(this.repository);

  Future<Either<Failure, Success>> call(
      UpdatePasswordParams updatePasswordParams) {
    return repository.updatePassword(
        oldPassword: updatePasswordParams.oldPassword,
        newPassword: updatePasswordParams.newPassword);
  }
}
