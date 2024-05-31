// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/notes/domain/usecases/create_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/get_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/update_note_usecase.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_event.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final CreateNote createNote;
  final DeleteNote deleteNote;
  final GetNote getNote;
  final UpdateNote updateNote;

  NoteBloc(
      {required this.createNote,
      required this.deleteNote,
      required this.getNote,
      required this.updateNote})
      : super(NoteInitial()) {
    on<CreateNoteEvent>(_onCreateNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
    on<GetNoteEvent>(_onGetNoteEvent);
    on<UpdateNoteEvent>(_onUpdateNoteEvent);
  }

  Future<void> _onCreateNoteEvent(
      CreateNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final result = await createNote(event.note);
    result.fold(
      (failure) => emit(NoteError('Failed to create question')),
      (success) => emit(NoteCreated(success.message)),
    );
  }

  Future<void> _onDeleteNoteEvent(
      DeleteNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final result = await deleteNote();
    result.fold(
      (failure) => emit(NoteError('Failed to delete question')),
      (success) => emit(NoteDeleted(success.message)),
    );
  }

  Future<void> _onGetNoteEvent(
      GetNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final result = await getNote();
    result.fold(
      (failure) => emit(NoteError('Failed to load questions')),
      (questions) => emit(NoteLoaded(questions)),
    );
  }

  Future<void> _onUpdateNoteEvent(
      UpdateNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final result = await updateNote(event.note);
    result.fold(
      (failure) => emit(NoteError('Failed to update question')),
      (success) => emit(NoteUpdated(success.message)),
    );
  }
}
