import 'package:dartz/dartz.dart';
import 'package:learn/core/errors/failure.dart';
import 'package:learn/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:learn/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:learn/features/auth/domain/entities/user.dart';
import 'package:learn/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDatasource localDataSource;

  AuthRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> loginUser(
      String userId, String password, String role) async {
    try {
      final user = await remoteDataSource.loginUser(userId, password, role);
      if (user != null) {
        await localDataSource.cacheUser(user);
        // return Right(user);
        throw UnimplementedError();
      } else {
        return const Left(ServerFailure('Invalid credentials'));
      }
    } catch (e) {
      return const Left(ServerFailure('Server error'));
    }
  }
}
