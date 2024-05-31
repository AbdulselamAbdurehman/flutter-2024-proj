import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/');
              },
            ),
            title: const Text('Back'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 31, color: Color(0xFF4280EF)),
                    ),
                    SizedBox(height: 20),
                    Text('Sign In to QuizApp'),
                    SizedBox(height: 10),
                    SigninForm()
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

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
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

  Color studentRoleColor = const Color(0xFF4280EF);
  Color instructorRoleColor = const Color(0xffffffff);
  String selectedRole = "STUDENT";
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Text('Username or Email'),
        TextField(
          controller: _userIdController,
          decoration: const InputDecoration(
            hintText: 'Username or Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text('Password'),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: const Color(0xFF4280EF),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign In',
                      style: TextStyle(color: Color(0xffffffff))),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
