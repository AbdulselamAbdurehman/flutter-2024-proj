// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/notes/domain/repositories/note_repository.dart';

class DeleteNote {
  final NoteRepository noteRepository;

  DeleteNote(this.noteRepository);

  Future<Either<Failure, Success>> call() async {
    return await noteRepository.deleteNote();
  }
}
