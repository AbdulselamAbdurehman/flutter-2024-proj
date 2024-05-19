import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/domain/usecases/create_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import '../../../../mocks/mock_note_repository.mocks.dart';

void main() {
  late CreateNote createNote;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    createNote = CreateNote(mockNoteRepository);
  });

  group('CreateNote Tests', () {
    final note = Note(noteText: 'Test Note');

    test('should call createNote on the repository', () async {
      // Arrange
      when(mockNoteRepository.createNote(any))
          .thenAnswer((_) async => const Right(Success('Note created')));

      // Act
      await createNote(note);

      // Assert
      verify(mockNoteRepository.createNote(note)).called(1);
    });

    test('should return Success when the call to repository is successful',
        () async {
      // Arrange
      when(mockNoteRepository.createNote(any))
          .thenAnswer((_) async => const Right(Success('Note created')));

      // Act
      final result = await createNote(note);

      // Assert
      expect(result, const Right(Success('Note created')));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Create note failed');
      when(mockNoteRepository.createNote(any))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await createNote(note);

      // Assert
      expect(result, const Left(failure));
    });
  });
}
