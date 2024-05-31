import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'quiz_app/presentation/pages/home_page.dart';
import 'quiz_app/presentation/pages/login_page.dart';
import 'quiz_app/presentation/pages/quiz_page.dart';
import 'quiz_app/presentation/pages/notes_page.dart';
import 'quiz_app/application/auth/auth_bloc.dart';
import 'quiz_app/application/quiz/quiz_bloc.dart';
import 'quiz_app/application/notes/notes_bloc.dart';
import 'quiz_app/domain/repositories/auth_repository.dart';
import 'quiz_app/domain/repositories/quiz_repository.dart';
import 'quiz_app/domain/repositories/notes_repository.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: AuthRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => QuizBloc(
            quizRepository: QuizRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => NotesBloc(
            notesRepository: NotesRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/quiz': (context) => QuizPage(),
          '/notes': (context) => NotesPage(),
        },
      ),
    );
  }
}