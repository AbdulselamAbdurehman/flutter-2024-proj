import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/data/datasources/question_local_datasource.dart';
import 'package:quiz_app/features/questions/data/datasources/question_remote_datasource.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionLocalDatasource questionLocalDatasource;
  final QuestionRemoteDatasource questionRemoteDatasource;

  QuestionRepositoryImpl(
      {required this.questionLocalDatasource,
      required this.questionRemoteDatasource});

  @override
  Future<Either<Failure, Success>> createQuestion(Question question) {
    // TODO: implement createQuestion
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> deleteQuestion(Question question) {
    // TODO: implement deleteQuestion
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Question>>> getQuestions() {
    // TODO: implement getQuestions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> updateQuestion(Question question) {
    // TODO: implement updateQuestion
    throw UnimplementedError();
  }
}
