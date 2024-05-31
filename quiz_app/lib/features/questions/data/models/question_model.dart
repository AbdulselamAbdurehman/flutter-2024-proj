import 'package:quiz_app/features/questions/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    super.questionNumber,
    required super.answer,
    required super.description,
    required super.explanation,
    required super.options,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionNumber': questionNumber,
      'answer': answer,
      'description': description,
      'explanation': explanation,
      'options': options,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionNumber: json['questionNumber'],
      answer: json['answer'],
      description: json['description'],
      explanation: json['explanation'],
      options: List<String>.from((json['options'])),
    );
  }
}
