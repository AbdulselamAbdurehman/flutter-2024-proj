// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String description;
  final String explanation;
  final List<String> options;
  final int answer;
  final int id;
  Question(
      {required this.id,
      required this.answer,
      required this.description,
      required this.explanation,
      required this.options});

  @override
  List<Object?> get props => [answer, description, explanation, id, options];
}
