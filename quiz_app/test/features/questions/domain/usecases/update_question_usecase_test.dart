import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/usecases/update_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import '../../../../mocks/mock_question_repository.mocks.dart';

void main() {
  late UpdateQuestion updateQuestion;
  late MockQuestionRepository mockQuestionRepository;

  setUp(() {
    mockQuestionRepository = MockQuestionRepository();
    updateQuestion = UpdateQuestion(mockQuestionRepository);
  });

  group('UpdateQuestion Tests', () {
    final Question mockQuestion = Question(
      description: 'Updated Question',
      explanation: 'Updated Explanation',
      options: const ['Option A', 'Option B', 'Option C'],
      answer: 1,
    );

    test('should update a question in the repository', () async {
      // Arrange
      when(mockQuestionRepository.updateQuestion(mockQuestion))
          .thenAnswer((_) async => const Right(Success('Question updated')));

      // Act
      final result = await updateQuestion(mockQuestion);

      // Assert
      expect(result, const Right(Success('Question updated')));
    });

    test('should return a Failure when repository returns a Failure', () async {
      // Arrange
      const failure = Failure('Failed to update question');
      when(mockQuestionRepository.updateQuestion(mockQuestion))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await updateQuestion(mockQuestion);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
