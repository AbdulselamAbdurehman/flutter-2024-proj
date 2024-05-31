// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String noteText;
  Note({required this.noteText});

  @override
  List<Object?> get props => [noteText];
}
