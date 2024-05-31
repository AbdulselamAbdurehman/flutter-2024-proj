import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/domain/repositories/auth_repository.dart';

class DeleteUser {
  final AuthRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failure, Success>> call() {
    return repository.deleteUser();
  }
}
