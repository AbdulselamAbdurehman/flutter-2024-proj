// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/data/datasources/question_local_datasource.dart';
import 'package:quiz_app/features/questions/data/datasources/question_remote_datasource.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/repositories/question_repository.dart';
import 'package:quiz_app/features/questions/data/models/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionLocalDatasource questionLocalDatasource;
  final QuestionRemoteDatasource questionRemoteDatasource;

  QuestionRepositoryImpl({
    required this.questionLocalDatasource,
    required this.questionRemoteDatasource,
  });

  @override
  Future<Either<Failure, Success>> createQuestion(Question question) async {
    if (await deviceIsConnected()) {
      final questionModel = QuestionModel(
        questionNumber: question.questionNumber,
        description: question.description,
        explanation: question.explanation,
        options: question.options,
        answer: question.answer,
      );
      final remoteResult =
          await questionRemoteDatasource.createQuestion(questionModel);
      return remoteResult.fold(
        (failure) => Left(failure),
        (_) async {
          // If successful, save the question locally
          final localResult =
              await questionLocalDatasource.putQuestions([questionModel]);
          return localResult.fold(
            (failure) => Left(failure),
            (success) => Right(success),
          );
        },
      );
    } else {
      return Left(NetworkFailure("No Internet"));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteQuestion(Question question) async {
    if (await deviceIsConnected()) {
      final questionModel = QuestionModel(
        questionNumber: question.questionNumber,
        description: question.description,
        explanation: question.explanation,
        options: question.options,
        answer: question.answer,
      );
      print('form delete question of question_repo_impl.dart');
      final remoteResult =
          await questionRemoteDatasource.deleteQuestion(questionModel);
      return remoteResult.fold(
        (failure) => Left(failure),
        (_) async {
          // If successful, delete the question locally
          final localResult =
              await questionLocalDatasource.deleteQuestion(questionModel);
          return localResult.fold(
            (failure) => Left(failure),
            (success) => Right(success),
          );
        },
      );
    } else {
      return Left(NetworkFailure('No Internet'));
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    if (await deviceIsConnected()) {
      final remoteResult = await questionRemoteDatasource.getQuestions();
      return remoteResult.fold(
        (failure) => Left(failure),
        (questionModels) async {
          // Save the fetched questions locally
          await questionLocalDatasource.putQuestions(questionModels);
          return Right(questionModels
              .map((model) => Question(
                  answer: model.answer,
                  description: model.description,
                  explanation: model.explanation,
                  options: model.options,
                  questionNumber: model.questionNumber))
              .toList());
        },
      );
    } else {
      final localResult = await questionLocalDatasource.getQuestions();
      return localResult.fold(
        (failure) => Left(failure),
        (questionModels) => Right(questionModels
            .map((model) => Question(
                questionNumber: model.questionNumber,
                answer: model.answer,
                description: model.description,
                explanation: model.explanation,
                options: model.options))
            .toList()),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> updateQuestion(Question question) async {
    if (await deviceIsConnected()) {
      final questionModel = QuestionModel(
        questionNumber: question.questionNumber,
        description: question.description,
        explanation: question.explanation,
        options: question.options,
        answer: question.answer,
      );
      final remoteResult =
          await questionRemoteDatasource.updateQuestion(questionModel);
      return remoteResult.fold(
        (failure) => Left(failure),
        (_) async {
          // If successful, update the question locally
          final localResult =
              await questionLocalDatasource.putQuestions([questionModel]);
          return localResult.fold(
            (failure) => Left(failure),
            (success) => Right(success),
          );
        },
      );
    } else {
      return Left(NetworkFailure('No Internet'));
    }
  }
}
