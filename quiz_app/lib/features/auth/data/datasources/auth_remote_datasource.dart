// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'auth_local_datasource.dart';

// Remote data source for authentication-related network operations
class AuthRemoteDataSource {
  final AuthLocalDataSource localDataSource;
  final String baseURL;

  AuthRemoteDataSource({required this.baseURL, required this.localDataSource});

  // Method for logging in a user
  Future<Either<Failure, Success>> login(
      String userId, String password, String role) async {
    try {
      print('login service called. from auth_remote_datasource.dart');

      // Sending POST request to login endpoint
      Response response = await http.post(
        Uri.parse('$baseURL/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': userId,
          'password': password,
          'role': role
        }),
      );
      print('from remote data source: statusCode = ${response.statusCode}');
      if ((response.statusCode) ~/ 100 == 2) {
        final token = jsonDecode(response.body)['token'];
        print(token);
        await localDataSource.setToken(token);
        return const Right(OperationSuccess('Login Success'));
      } else {
        return const Left(OperationFailure('Bad Request'));
      }
    } catch (e) {
      return const Left(OperationFailure('Bad Request'));
    }
  }

  // Method for signing up a new user
  Future<Either<Failure, Success>> signup(
      String username, String password, String email, String role) async {
    try {
      // Sending POST request to signup endpoint
      Response response = await http.post(
        Uri.parse('$baseURL/users/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email,
          'role': role
        }),
      );
      if ((response.statusCode) ~/ 100 == 2) {
        return const Right(OperationSuccess('Sign Up Successful'));
      } else {
        return const Left(OperationFailure('Sign Up Not Successful'));
      }
    } catch (e) {
      return const Left(OperationFailure('Something Went Wrong.'));
    }
  }

  // Method for updating the username
  Future<Either<Failure, Success>> updateUsername(String newUsername) async {
    try {
      final token = await localDataSource.getToken();
      // Sending PATCH request to update username
      Response response = await http.patch(
        Uri.parse('$baseURL/users/username'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'newUsername': newUsername,
        }),
      );
      print('from remote data source: statusCode = ${response.statusCode}');

      if ((response.statusCode) ~/ 100 == 2) {
        final token = jsonDecode(response.body)['token'];
        await localDataSource.setToken(token);
        return const Right(OperationSuccess('Update Successful'));
      } else {
        return const Left(OperationFailure('Bad Request'));
      }
    } catch (e) {
      return const Left(OperationFailure('Bad Request'));
    }
  }

  // Method for updating the password
  Future<Either<Failure, Success>> updatePassword(
      String oldPassword, String newPassword) async {
    try {
      final token = await localDataSource.getToken();
      // Sending PATCH request to update password
      Response response = await http.patch(
        Uri.parse('$baseURL/users/password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'oldPassword': oldPassword,
          'newPassword': newPassword
        }),
      );

      if ((response.statusCode) ~/ 100 == 2) {
        print(
            'from auth_remote_datasource.dart  updatepassword+ ${response.body}');
        final token = jsonDecode(response.body)['token'];
        await localDataSource.setToken(token);
        return const Right(OperationSuccess('Update Successful'));
      } else {
        return const Left(OperationFailure('Bad Request'));
      }
    } catch (e) {
      return const Left(OperationFailure('Bad Request'));
    }
  }

  // Method for deleting a user account
  Future<Either<Failure, Success>> deleteUser() async {
    try {
      final token = await localDataSource.getToken();
      // Sending DELETE request to delete user
      Response response = await http.delete(
        Uri.parse('$baseURL/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if ((response.statusCode) ~/ 100 == 2) {
        return const Right(OperationSuccess('We Are Sorry to See You go.'));
      } else {
        return const Left(OperationFailure('Bad Request'));
      }
    } catch (e) {
      return const Left(OperationFailure('Bad Request'));
    }
  }
}
