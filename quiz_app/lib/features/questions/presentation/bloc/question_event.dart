import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class FetchQuestionsEvent extends QuestionEvent {}

class CreateQuestionEvent extends QuestionEvent {
  final Question question;

  const CreateQuestionEvent(this.question);

  @override
  List<Object> get props => [question];
}

class UpdateQuestionEvent extends QuestionEvent {
  final Question question;

  const UpdateQuestionEvent(this.question);

  @override
  List<Object> get props => [question];
}

class DeleteQuestionEvent extends QuestionEvent {
  final Question question;

  const DeleteQuestionEvent(this.question);

  @override
  List<Object> get props => [question];
}
