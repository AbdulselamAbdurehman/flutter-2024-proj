import 'dart:convert';
import 'package:quiz_app/features/questions/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.id,
    required super.answer,
    required super.description,
    required super.explanation,
    required super.options,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
      'description': description,
      'explanation': explanation,
      'options': jsonEncode(options),
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      answer: json['answer'],
      description: json['description'],
      explanation: json['explanation'],
      options: List<String>.from(jsonDecode(json['options'])),
    );
  }
}
