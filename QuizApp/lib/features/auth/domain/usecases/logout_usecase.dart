import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
// import 'package:learn/core/usecases/usecase.dart';
import 'package:learn/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase implements UseCase<User, NoParams> {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    // TODO: implement logout usecase
    throw UnimplementedError();
  }
}

