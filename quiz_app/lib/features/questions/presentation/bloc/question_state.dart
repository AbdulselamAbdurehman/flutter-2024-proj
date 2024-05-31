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

class QuestionFetchError extends QuestionState {
  final String message;
  const QuestionFetchError(this.message);
  @override
  List<Object> get props => [message];
}

class QuestionError extends QuestionState {
  final String message;

  const QuestionError(this.message);

  @override
  List<Object> get props => [message];
}

class QuestionSuccess extends QuestionState {
  final String message;
  const QuestionSuccess(this.message);

  @override
  List<Object> get props => [message];
}
