// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import 'package:quiz_app/features/notes/domain/repositories/note_repository.dart';

class GetNote {
  final NoteRepository noteRepository;

  GetNote(this.noteRepository);

  Future<Either<Failure, Note>> call() async {
    return await noteRepository.getNote();
  }
}
