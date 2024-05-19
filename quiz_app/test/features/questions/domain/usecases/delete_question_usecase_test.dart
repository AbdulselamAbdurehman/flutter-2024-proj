import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/usecases/delete_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import '../../../../mocks/mock_question_repository.mocks.dart';

void main() {
  late DeleteQuestion deleteQuestion;
  late MockQuestionRepository mockQuestionRepository;

  setUp(() {
    mockQuestionRepository = MockQuestionRepository();
    deleteQuestion = DeleteQuestion(mockQuestionRepository);
  });

  group('DeleteQuestion Tests', () {
    final Question mockQuestion = Question(
      description: 'Question to delete',
      explanation: 'Explanation',
      options: const ['Option A', 'Option B', 'Option C'],
      answer: 1,
    );

    test('should delete a question from the repository', () async {
      // Arrange
      when(mockQuestionRepository.deleteQuestion(mockQuestion))
          .thenAnswer((_) async => const Right(Success('Question deleted')));

      // Act
      final result = await deleteQuestion(mockQuestion);

      // Assert
      expect(result, const Right(Success('Question deleted')));
    });

    test('should return a Failure when repository returns a Failure', () async {
      // Arrange
      const failure = Failure('Failed to delete question');
      when(mockQuestionRepository.deleteQuestion(mockQuestion))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await deleteQuestion(mockQuestion);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
