// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:quiz_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:quiz_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:quiz_app/features/auth/domain/usecases/delete_user_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_username_usecase.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:quiz_app/features/auth/presentation/screens/account_settings.dart';
import 'package:quiz_app/features/auth/presentation/screens/signin_screen.dart';
import 'package:quiz_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:quiz_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:quiz_app/features/notes/data/datasources/note_remote_datasource.dart';
import 'package:quiz_app/features/notes/data/repositories/note_repository_impl.dart';
import 'package:quiz_app/features/notes/domain/usecases/create_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/delete_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/get_note_usecase.dart';
import 'package:quiz_app/features/notes/domain/usecases/update_note_usecase.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_bloc.dart';
import 'package:quiz_app/features/notes/presentation/screens/note_screen.dart';
import 'package:quiz_app/features/questions/data/datasources/question_local_datasource.dart';
import 'package:quiz_app/features/questions/data/datasources/question_remote_datasource.dart';
import 'package:quiz_app/features/questions/data/repositories/question_repository_impl.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/domain/usecases/create_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/delete_question_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/fetch_questions_usecase.dart';
import 'package:quiz_app/features/questions/domain/usecases/update_question_usecase.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_bloc.dart';
import 'package:quiz_app/features/questions/presentation/screens/question_form.dart';
import 'package:quiz_app/features/questions/presentation/screens/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app/features/questions/presentation/screens/instructor_screen.dart';

Future<void> main() async {
  //shared Dependecies
  final sharedPreferences = await SharedPreferences.getInstance();
  final localDatasource = LocalDataSource(sharedPreferences: sharedPreferences);
  const baseUrl = 'http://10.0.2.2:3000';

  //datasources DI
  final authLocalDatasource =
      AuthLocalDataSource(localDataSource: localDatasource);
  final remoteDataSource = AuthRemoteDataSource(
    baseURL: baseUrl,
    localDataSource: authLocalDatasource,
  );

  //repository DI
  final authRepository = AuthRepositoryImpl(
    authLocalDataSource: authLocalDatasource,
    authRemoteDataSource: remoteDataSource,
  );

  //auth usecases DI
  final login = Login(authRepository);
  final signUp = Signup(authRepository);
  final logout = Logout(authRepository);
  final updatePassword = UpdatePassword(authRepository);
  final updateUsername = UpdateUsername(authRepository);
  final deleteUser = DeleteUser(authRepository);

  //questions datasources DI
  final questionLocalDatasource = QuestionLocalDatasource();
  final questionRemoteDatasource = QuestionRemoteDatasource(
      baseURL: baseUrl, localDataSource: localDatasource);
  final questionRepository = QuestionRepositoryImpl(
      questionLocalDatasource: questionLocalDatasource,
      questionRemoteDatasource: questionRemoteDatasource);

  //questions usecases
  final createQuestion = CreateQuestion(questionRepository);
  final deleteQuestion = DeleteQuestion(questionRepository);
  final fetchQuestions = FetchQuestions(questionRepository);
  final updateQuestion = UpdateQuestion(questionRepository);

  //note data sources
  final noteLocalDatasource = NoteLocalDatasource();
  final noteRemoteDatasource =
      NoteRemoteDatasource(baseURL: baseUrl, localDataSource: localDatasource);
  final noteRepository = NoteRepositoryImpl(
      noteLocalDatasource: noteLocalDatasource,
      noteRemoteDatasource: noteRemoteDatasource);

  //note usecases
  final createNote = CreateNote(noteRepository);
  final deleteNote = DeleteNote(noteRepository);
  final getNote = GetNote(noteRepository);
  final updateNote = UpdateNote(noteRepository);

  //router setup
  final GoRouter router = GoRouter(
    initialLocation: await hasValidToken(sharedPreferences) ? '/settings' : '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Home()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/settings', builder: (context, state) => const Settings()),
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
      GoRoute(
          path: '/student_screen',
          builder: (context, state) => const StudentScreen()),
      GoRoute(
          path: '/instructor_screen',
          builder: (context, state) => const InstructorScreen()),
      GoRoute(
        path: '/question_form',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return QuestionForm(
            question: extra?['question'] as Question?,
            edit: extra?['edit'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/note',
        builder: (context, state) => NoteScreen(),
      )
    ],
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
              login: login,
              signUp: signUp,
              logout: logout,
              updatePassword: updatePassword,
              updateUsername: updateUsername,
              deleteUser: deleteUser),
        ),
        BlocProvider<QuestionBloc>(
          create: (BuildContext context) => QuestionBloc(
              createQuestion: createQuestion,
              deleteQuestion: deleteQuestion,
              fetchQuestions: fetchQuestions,
              updateQuestion: updateQuestion),
        ),
        BlocProvider<NoteBloc>(
          create: (BuildContext context) => NoteBloc(
              createNote: createNote,
              deleteNote: deleteNote,
              getNote: getNote,
              updateNote: updateNote),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome To',
                  style: TextStyle(fontSize: 42, color: Color(0xFF4280EF)),
                ),
                const Text(
                  'QuizApp',
                  style: TextStyle(fontSize: 42, color: Color(0xFF4280EF)),
                ),
                const Text(
                  'Let\'s get started',
                ),
                const Center(
                  child: Text(
                    'Q',
                    style: TextStyle(fontSize: 200, color: Color(0xFF4280EF)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(5),
                          side: const BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Color(0xFF4280EF)),
                          backgroundColor: const Color(0xFF4280EF),
                          elevation: 0,
                        ),
                        onPressed: () {
                          context.go('/signin');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Color(0xffffffff)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('New to QuizApp'),
                    TextButton(
                        onPressed: () {
                          context.go('/signup');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Color(0xFF4280EF)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> hasValidToken(SharedPreferences prefs) async {
  String? token = prefs.getString('TOKEN');

  if (token != null) {
    if (!JwtDecoder.isExpired(token)) {
      return true;
    } else {
      await prefs.remove('TOKEN');
      return false;
    }
  }
  return false;
}

// void makeRequest() async {
//   String baseURL = 'http://localhost:3000';
//   String token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmR1QGdtYWlsLmNvbSIsInJvbGUiOiJJTlNUUlVDVE9SIiwiaWF0IjoxNzE3OTQ2OTc2LCJleHAiOjE3MTc5NDk5NzZ9.3AOxMmBWAUuTicKYEZqDvDWZvDWhaRdOAe2LgTzaWPo';
//   final response = await http.get(
//     Uri.parse('$baseURL/questions'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer $token',
//     },
//   );
//   print(response.statusCode);
//   final result = response.body;
//   print(response.statusCode);
//   final finalResult = List<Map<String, dynamic>>.from(jsonDecode(result));
//   for (var map in finalResult) {
//     // Your logic for iterating over each map in finalResult
//     print(map);
//   }
// }

//   // if ((response.statusCode) ~/ 100 == 2) {
//   //   final List<dynamic> jsonList = jsonDecode(response.body);
//   //   final List<QuestionModel> result =
//   //       jsonList.map((json) => QuestionModel.fromJson(json)).toList();
//   //   return Right(result);
//   // } else {
//   //   return const Left(OperationFailure('Couldn\'t Fetch questions'));
//   // }

