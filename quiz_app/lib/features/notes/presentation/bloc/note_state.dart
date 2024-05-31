// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final Note note;

  const NoteLoaded(this.note);

  @override
  List<Object?> get props => [note];
}

class NoteError extends NoteState {
  final String message;

  NoteError(this.message);

  @override
  List<Object?> get props => [message];
}

class NoteCreated extends NoteState {
  final String message;
  const NoteCreated(this.message);

  @override
  List<Object?> get props => [message];
}

class NoteUpdated extends NoteState {
  final String message;

  NoteUpdated(this.message);
  @override
  List<Object?> get props => [message];
}

class NoteDeleted extends NoteState {
  final String message;
  NoteDeleted(this.message);

  @override
  List<Object?> get props => [message];
}
