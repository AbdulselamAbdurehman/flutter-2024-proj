import 'package:flutter/material.dart';

void main() {
  runApp(const SignIn());
}

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            title: const Text('Back'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 42, color: Color(0xFF4280EF)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Sign In to QuizApp'),
                    const SizedBox(height: 10),
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
                              backgroundColor: const Color(0xFF4280EF),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Student',
                                  style: TextStyle(color: Color(0xffffffff))),
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
                              backgroundColor: const Color(0xFF4280EF),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Instructor',
                                  style: TextStyle(color: Color(0xffffffff))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const SigninForm()
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
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  side: const BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFF4280EF)),
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
