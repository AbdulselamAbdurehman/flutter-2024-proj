import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/repositories/question_repository.dart';

class DeleteQuestion {
  final QuestionRepository questionRepository;

  DeleteQuestion(this.questionRepository);

  Future<Either<Failure, Success>> call(Question question) async {
    return await questionRepository.deleteQuestion(question);
  }
}
