import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/features/notes/domain/usecases/get_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import '../../../../mocks/mock_note_repository.mocks.dart';

void main() {
  late GetNote getNote;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    getNote = GetNote(mockNoteRepository);
  });

  group('GetNote Tests', () {
    const noteText = 'Test Note';
    final note = Note(noteText: noteText);

    test('should call getNote on the repository', () async {
      // Arrange
      when(mockNoteRepository.getNote()).thenAnswer((_) async => Right(note));

      // Act
      await getNote();

      // Assert
      verify(mockNoteRepository.getNote()).called(1);
    });

    test('should return Note when the call to repository is successful',
        () async {
      // Arrange
      when(mockNoteRepository.getNote()).thenAnswer((_) async => Right(note));

      // Act
      final result = await getNote();

      // Assert
      expect(result, Right(note));
    });

    test('should return Failure when the call to repository is unsuccessful',
        () async {
      // Arrange
      const failure = Failure('Get note failed');
      when(mockNoteRepository.getNote())
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await getNote();

      // Assert
      expect(result, const Left(failure));
    });
  });
}
