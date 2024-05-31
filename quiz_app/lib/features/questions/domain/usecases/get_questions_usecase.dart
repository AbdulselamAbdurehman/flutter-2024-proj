// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/repositories/question_repository.dart';

class GetQuestions {
  final QuestionRepository questionRepository;

  GetQuestions(this.questionRepository);

  Future<Either<Failure, List<Question>>> call() async {
    return await questionRepository.getQuestions();
  }
}
