import 'package:quiz_app/features/notes/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({required super.noteText});

  Map<String, dynamic> toJson() => {'noteText': noteText};

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(noteText: json['noteText']);
  }
}
