// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/data/models/note_model.dart';

class NoteRemoteDatasource {
  final String baseURL;
  final LocalDataSource localDataSource;

  NoteRemoteDatasource({required this.baseURL, required this.localDataSource});

  Future<Either<Failure, Success>> createNote(NoteModel note) async {
    final token = await localDataSource.getToken();
    final response = await http.post(
      Uri.parse('$baseURL/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(note.toJson()),
    );

    if ((response.statusCode) ~/ 100 == 2) {
      return const Right(OperationSuccess('Note Created.'));
    } else {
      return const Left(OperationFailure('Creating Note Unsuccesfull'));
    }
  }

  Future<Either<Failure, Success>> deleteNote() async {
    final token = await localDataSource.getToken();
    final response = await http.delete(
      Uri.parse('$baseURL/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if ((response.statusCode) ~/ 100 == 2) {
      return const Right(OperationSuccess('Note Deleted.'));
    } else {
      return const Left(OperationFailure('Note Not Deleted'));
    }
  }

  Future<Either<Failure, NoteModel>> getNote() async {
    final token = await localDataSource.getToken();
    final response = await http.get(
      Uri.parse('$baseURL/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if ((response.statusCode) ~/ 100 == 2) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(
          'from note_remote_datasource.dart. Decoded JSON: $json'); // Log the JSON response

      return Right(NoteModel.fromJson(json));
    } else {
      return const Left(OperationFailure('Couldn\'t Fetch note'));
    }
  }

  Future<Either<Failure, Success>> updateNote(NoteModel note) async {
    final token = await localDataSource.getToken();
    final response = await http.patch(
      Uri.parse('$baseURL/notes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(note.toJson()),
    );

    if ((response.statusCode) ~/ 100 == 2) {
      return Right(OperationSuccess('Note Updated Successfully'));
    } else {
      return const Left(OperationFailure('Note Not Updated'));
    }
  }
}
