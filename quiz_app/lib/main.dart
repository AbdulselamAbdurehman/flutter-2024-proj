import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quiz_app/features/auth/presentation/pages/account_settings.dart';
// import 'package:quiz_app/features/auth/presentation/pages/signin_page.dart';
import 'package:quiz_app/features/auth/presentation/pages/signup_page.dart';
import 'package:quiz_app/service_locator.dart';
import 'package:quiz_app/try.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const Home()),
  GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
  // GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
  GoRoute(path: '/settings', builder: (context, state) => const Settings()),
  GoRoute(
      path: '/signin',
      builder: (context, state) => const TryInPage()), //Temporary
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
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

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('questions page'),
    );
  }
}
