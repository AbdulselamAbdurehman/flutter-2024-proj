// All necessary packages imported
import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';

//Represents an authentication repository
// Returns an Either containing either a Failure or a Success
abstract class AuthRepository {
  Future<Either<Failure, Success>> login(
      {required String userId, required String password, required String role});

  
  // Registers a new user account
  Future<Either<Failure, Success>> signup(
      {required String username,
      required String password,
      required String email,
      required String role});

  Future<void> logout();
 // Updates the user username
  Future<Either<Failure, Success>> updateUsername(
      {required String newUsername});

  Future<Either<Failure, Success>> updatePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<Failure, Success>> deleteUser();
}
