import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/domain/usecases/create_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import '../../../../mocks/mock_question_repository.mocks.dart';

void main() {
  late CreateQuestion createQuestion;
  late MockQuestionRepository mockQuestionRepository;

  setUp(() {
    mockQuestionRepository = MockQuestionRepository();
    createQuestion = CreateQuestion(mockQuestionRepository);
  });

  group('CreateQuestion Tests', () {
    final question = Question(
      description: 'Test question',
      explanation: 'Explanation',
      options: const ['Option 1', 'Option 2', 'Option 3'],
      answer: 1,
    );

    test('should call createQuestion on the repository', () async {
      // Arrange
      when(mockQuestionRepository.createQuestion(
        question,
      )).thenAnswer((_) async => const Right(Success('Question created')));

      // Act
      await createQuestion(question);

      // Assert
      verify(mockQuestionRepository.createQuestion(question)).called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockQuestionRepository.createQuestion(
        question,
      )).thenAnswer((_) async => const Right(Success('Question created')));

      // Act
      final result = await createQuestion(question);

      // Assert
      expect(result, const Right(Success('Question created')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Create question failed');
      when(mockQuestionRepository.createQuestion(
        question,
      )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await createQuestion(question);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
