// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
  @override
  List<Object?> get props => [];
}

class CreateNoteEvent extends NoteEvent {
  final Note note;
  CreateNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

class DeleteNoteEvent extends NoteEvent {}

class GetNoteEvent extends NoteEvent {}

class UpdateNoteEvent extends NoteEvent {
  final Note note;

  UpdateNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}
