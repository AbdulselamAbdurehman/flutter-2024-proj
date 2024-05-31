// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/questions/domain/usecases/create_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/delete_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/fetch_questions_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/update_question_usecase.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_event.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final CreateQuestion createQuestion;
  final DeleteQuestion deleteQuestion;
  final FetchQuestions fetchQuestions;
  final UpdateQuestion updateQuestion;

  QuestionBloc({
    required this.createQuestion,
    required this.deleteQuestion,
    required this.fetchQuestions,
    required this.updateQuestion,
  }) : super(QuestionInitial()) {
    on<FetchQuestionsEvent>(_onFetchQuestions);
    on<CreateQuestionEvent>(_onCreateQuestion);
    on<UpdateQuestionEvent>(_onUpdateQuestion);
    on<DeleteQuestionEvent>(_onDeleteQuestion);
  }

  Future<void> _onFetchQuestions(
      FetchQuestionsEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final result = await fetchQuestions();
    result.fold(
      (failure) => emit(QuestionFetchError('Failed to load questions')),
      (questions) => emit(QuestionLoaded(questions)),
    );
  }

  Future<void> _onCreateQuestion(
      CreateQuestionEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final result = await createQuestion(event.question);
    result.fold(
      (failure) => emit(QuestionError('Failed to create question')),
      (success) => emit(QuestionSuccess(success.message)),
    );
  }

  Future<void> _onUpdateQuestion(
      UpdateQuestionEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final result = await updateQuestion(event.question);
    result.fold(
      (failure) => emit(QuestionError('Failed to update question')),
      (success) => emit(QuestionSuccess(success.message)),
    );
  }

  Future<void> _onDeleteQuestion(
      DeleteQuestionEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final result = await deleteQuestion(event.question);
    result.fold(
      (failure) => emit(QuestionError('Failed to delete question')),
      (success) => emit(QuestionSuccess(success.message)),
    );
  }
}
