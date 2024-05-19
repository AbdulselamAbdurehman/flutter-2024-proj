import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/features/questions/domain/usecases/fetch_questions_usecase.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import '../../../../mocks/mock_question_repository.mocks.dart';

void main() {
  late FetchQuestions fetchQuestions;
  late MockQuestionRepository mockQuestionRepository;

  setUp(() {
    mockQuestionRepository = MockQuestionRepository();
    fetchQuestions = FetchQuestions(mockQuestionRepository);
  });

  group('FetchQuestions Tests', () {
    final List<Question> mockQuestions = [
      Question(
        description: 'Question 1',
        explanation: 'Explanation 1',
        options: const ['Option 1A', 'Option 1B', 'Option 1C'],
        answer: 0,
      ),
      Question(
        description: 'Question 2',
        explanation: 'Explanation 2',
        options: const ['Option 2A', 'Option 2B', 'Option 2C'],
        answer: 1,
      ),
    ];

    test('should return a list of questions from the repository', () async {
      // Arrange
      when(mockQuestionRepository.getQuestions())
          .thenAnswer((_) async => Right(mockQuestions));

      // Act
      final result = await fetchQuestions();

      // Assert
      expect(result, Right(mockQuestions));
    });

    test('should return a Failure when repository returns a Failure', () async {
      // Arrange
      const failure = Failure('Failed to fetch questions');
      when(mockQuestionRepository.getQuestions())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await fetchQuestions();

      // Assert
      expect(result, const Left(failure));
    });
  });
}
