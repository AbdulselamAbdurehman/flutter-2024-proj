import 'package:flutter/material.dart';
import 'reusable.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome To',
                style: TextStyle(
                    color: Color(0xFF4280EF),
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'QuizApp',
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4280EF)),
              ),
              const Text(
                'Let\'s get started',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Q',
                    style: TextStyle(fontSize: 200, color: Color(0xFF4280EF)),
                  ),
                ],
              ),
              const Text(
                'Sign in',
                style: TextStyle(
                  color: Color(0xFF4280EF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const CustomElevatedButton(buttonText: 'Student'),
              const SizedBox(height: 10),
              const CustomOutlinedButton(buttonText: 'Instructor'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'New To QuizApp?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color(0xFF4280EF)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
