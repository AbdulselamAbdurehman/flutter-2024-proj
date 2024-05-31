import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
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
                          onPressed: () {},
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
                          onPressed: () {},
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

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const Button(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5),
        side: const BorderSide(
            width: 1.0, style: BorderStyle.solid, color: Color(0xFF4280EF)),
        backgroundColor: color,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
