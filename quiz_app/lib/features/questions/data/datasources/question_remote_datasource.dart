// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/data/models/question_model.dart';

class QuestionRemoteDatasource {
  final String baseURL;
  final LocalDataSource localDataSource;

  QuestionRemoteDatasource(
      {required this.baseURL, required this.localDataSource});

  Future<Either<Failure, Success>> createQuestion(
      QuestionModel question) async {
    //typing may be required for response var
    final token = await localDataSource.getToken();
    final response = await http.post(
      Uri.parse('$baseURL/questions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(question.toJson()),
      // ;
      // }),
    );

    if ((response.statusCode) ~/ 100 == 2) {
      return const Right(OperationSuccess('Question Posted.'));
    } else {
      return const Left(OperationFailure('Posting Unsuccesfull'));
    }
  }

  Future<Either<Failure, Success>> deleteQuestion(
      QuestionModel question) async {
    final token = await localDataSource.getToken();
    final response = await http.delete(
      Uri.parse('$baseURL/questions/${question.questionNumber}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(
        'question_remote_datasource.dart. statusCode: ${response.statusCode}');
    if ((response.statusCode) ~/ 100 == 2) {
      return const Right(OperationSuccess('Question Deleted.'));
    } else {
      return const Left(OperationFailure('Question Not Deleted'));
    }
  }

  Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
    final token = await localDataSource.getToken();
    final response = await http.get(
      Uri.parse('$baseURL/questions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if ((response.statusCode) ~/ 100 == 2) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<QuestionModel> result =
          jsonList.map((json) => QuestionModel.fromJson(json)).toList();
      return Right(result);
    } else {
      return const Left(OperationFailure('Couldn\'t Fetch questions'));
    }
  }

  Future<Either<Failure, Success>> updateQuestion(
      QuestionModel question) async {
    final token = await localDataSource.getToken();
    final response = await http.patch(
      Uri.parse('$baseURL/questions/${question.questionNumber}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(question.toJson()),
    );

    if ((response.statusCode) ~/ 100 == 2) {
      return Right(OperationSuccess('Question Updated Successfully'));
    } else {
      return const Left(OperationFailure('Question Not Updated'));
    }
  }
}
