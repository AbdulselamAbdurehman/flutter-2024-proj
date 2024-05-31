// question_state.dart
import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;

  const QuestionLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

class QuestionError extends QuestionState {
  final String message;

  const QuestionError(this.message);

  @override
  List<Object> get props => [message];
}

class QuestionCreated extends QuestionState {
  final String message;

  const QuestionCreated(this.message);

  @override
  List<Object> get props => [message];
}

class QuestionUpdated extends QuestionState {
  final String message;

  const QuestionUpdated(this.message);

  @override
  List<Object> get props => [message];
}

class QuestionDeleted extends QuestionState {
  final String message;

  const QuestionDeleted(this.message);

  @override
  List<Object> get props => [message];
}
