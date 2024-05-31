// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
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
import 'package:quiz_app/features/auth/presentation/pages/account_settings.dart';
import 'package:quiz_app/features/auth/presentation/pages/signin_page.dart';
import 'package:quiz_app/features/auth/presentation/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //datasources DI
  final sharedPreferences = await SharedPreferences.getInstance();
  final localDataSource = LocalDataSource(sharedPreferences: sharedPreferences);
  final authLocalDatasource =
      AuthLocalDataSource(localDataSource: localDataSource);
  final remoteDataSource = AuthRemoteDataSource(
    baseURL: 'http://localhost:3000',
    localDataSource: authLocalDatasource,
  );

  //repository DI
  final authRepository = AuthRepositoryImpl(
    authLocalDataSource: authLocalDatasource,
    authRemoteDataSource: remoteDataSource,
  );

  //usecases DI
  final login = Login(authRepository);
  final signUp = Signup(authRepository);
  final logout = Logout(authRepository);
  final updatePassword = UpdatePassword(authRepository);
  final updateUsername = UpdateUsername(authRepository);
  final deleteUser = DeleteUser(authRepository);

  //router setup
  final GoRouter router = GoRouter(
    initialLocation: await hasValidToken(sharedPreferences) ? '/settings' : '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Home()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/settings', builder: (context, state) => const Settings()),
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
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
