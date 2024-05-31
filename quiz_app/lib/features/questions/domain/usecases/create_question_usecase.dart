// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/repositories/question_repository.dart';

class CreateQuestion {
  final QuestionRepository questionRepository;

  CreateQuestion(this.questionRepository);

  Future<Either<Failure, Success>> call(Question question) async {
    return await questionRepository.createQuestion(question);
  }
}
