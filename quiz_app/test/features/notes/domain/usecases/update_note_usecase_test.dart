import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/domain/usecases/update_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import '../../../../mocks/mock_note_repository.mocks.dart';

void main() {
  late UpdateNote updateNote;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    updateNote = UpdateNote(mockNoteRepository);
  });

  group('UpdateNote Tests', () {
    final note = Note(noteText: 'Test Note');

    test('should call updateNote on the repository', () async {
      // Arrange
      when(mockNoteRepository.updateNote(any))
          .thenAnswer((_) async => const Right(Success('Note updated')));

      // Act
      await updateNote(note);

      // Assert
      verify(mockNoteRepository.updateNote(note)).called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockNoteRepository.updateNote(any))
          .thenAnswer((_) async => const Right(Success('Note updated')));

      // Act
      final result = await updateNote(note);

      // Assert
      expect(result, const Right(Success('Note updated')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Update note failed');
      when(mockNoteRepository.updateNote(any))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await updateNote(note);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
