import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, Success>> createNote(Note note);
  Future<Either<Failure, Success>> updateNote(Note note);
  Future<Either<Failure, Success>> deleteNote();
  Future<Either<Failure, Note>> getNote();
}
