import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';

abstract class QuestionRepository {
  Future<Either<Failure, Success>> createQuestion(Question question);
  Future<Either<Failure, Success>> updateQuestion(Question question);
  Future<Either<Failure, Success>> deleteQuestion(Question question);
  Future<Either<Failure, List<Question>>> getQuestions();
}
