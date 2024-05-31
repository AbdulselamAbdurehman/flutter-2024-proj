// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_state.dart';

void main() {
  runApp(const SignUpPage());
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 31, color: Color(0xFF4280EF)),
                ),
                SizedBox(height: 20),
                Text('Please create a new account'),
                SizedBox(height: 10),
                SignupForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  void switchToRole(String role) {
    if (role == selectedRole) return;
    Color temp = studentRoleColor;
    studentRoleColor = instructorRoleColor;
    instructorRoleColor = temp;
    if (selectedRole == 'STUDENT') {
      selectedRole = 'INSTRUCTOR';
    } else {
      selectedRole = 'STUDENT';
    }
  }

  final _signUpFormKey = GlobalKey<FormState>();
  Color studentRoleColor = const Color(0xFF4280EF);
  Color instructorRoleColor = const Color(0xffffffff);
  String selectedRole = "STUDENT";
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          print('from signup_page.dart sign up failure');
        } else if (state is AuthSuccess) {
          print(' from signup_page.dart signup success');
          context.go('/signin');
        }
      },
      builder: (context, state) => Form(
        key: _signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      side: const BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Color(0xFF4280EF)),
                      backgroundColor: studentRoleColor,
                      elevation: 0,
                    ),
                    onPressed: () => {
                      setState(() {
                        switchToRole('STUDENT');
                      })
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Student',
                        style: TextStyle(color: instructorRoleColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      side: const BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Color(0xFF4280EF)),
                      backgroundColor: instructorRoleColor,
                      elevation: 0,
                    ),
                    onPressed: () => {
                      setState(() {
                        switchToRole('INSTRUCTOR');
                      })
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Instructor',
                        style: TextStyle(color: studentRoleColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Text('Username'),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username can\'t be empty';
                }
                return null;
              },
              controller: _usernameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 13),
            const Text('Email'),
            TextFormField(
              validator: validateEmail,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 13),
            const Text('Password'),
            TextFormField(
              validator: (value) {
                if (value == null || value.length < 5 || value.length > 10) {
                  return 'Password must be 5 to 10 chars';
                }
                return null;
              },
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                    value: _agreedToTerms,
                    onChanged: (newValue) {
                      setState(() {
                        _agreedToTerms = !_agreedToTerms;
                      });
                    }),
                const Flexible(
                  child: Text(
                    'I agree to the Terms of Service',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 29),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      backgroundColor: const Color(0xFF4280EF),
                      elevation: 0,
                    ),
                    onPressed: _agreedToTerms
                        ? () {
                            if (_signUpFormKey.currentState!.validate()) {
                              print(
                                  'email: ${_emailController.text}: $selectedRole, username: ${_usernameController.text}, password: ${_passwordController.text}');
                              BlocProvider.of<AuthBloc>(context).add(
                                  SignupEvent(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                      role: selectedRole,
                                      email: _emailController.text));
                            }
                          }
                        : null,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
