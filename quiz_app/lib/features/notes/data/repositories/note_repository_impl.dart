import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:quiz_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:quiz_app/features/notes/data/models/note_model.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import 'package:quiz_app/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource noteRemoteDatasource;
  final NoteLocalDatasource noteLocalDatasource;

  NoteRepositoryImpl(
      {required this.noteLocalDatasource, required this.noteRemoteDatasource});

  @override
  Future<Either<Failure, Success>> createNote(Note note) {
    return noteRemoteDatasource.createNote(NoteModel(noteText: note.noteText));
  }

  @override
  Future<Either<Failure, Success>> deleteNote() {
    return noteRemoteDatasource.deleteNote();
  }

  @override
  Future<Either<Failure, Note>> getNote() {
    return noteRemoteDatasource.getNote();
  }

  @override
  Future<Either<Failure, Success>> updateNote(Note note) {
    return noteRemoteDatasource.updateNote(NoteModel(noteText: note.noteText));
  }
}
