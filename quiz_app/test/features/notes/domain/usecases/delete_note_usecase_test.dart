import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/domain/usecases/delete_note_usecase.dart';
import '../../../../mocks/mock_note_repository.mocks.dart';

void main() {
  late DeleteNote deleteNote;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    deleteNote = DeleteNote(mockNoteRepository);
  });

  group('DeleteNote Tests', () {
    test('should call deleteNote on the repository', () async {
      // Arrange
      when(mockNoteRepository.deleteNote())
          .thenAnswer((_) async => const Right(Success('Note deleted')));

      // Act
      await deleteNote();

      // Assert
      verify(mockNoteRepository.deleteNote()).called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockNoteRepository.deleteNote())
          .thenAnswer((_) async => const Right(Success('Note deleted')));

      // Act
      final result = await deleteNote();

      // Assert
      expect(result, const Right(Success('Note deleted')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Delete note failed');
      when(mockNoteRepository.deleteNote())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await deleteNote();

      // Assert
      expect(result, const Left(failure));
    });
  });
}
