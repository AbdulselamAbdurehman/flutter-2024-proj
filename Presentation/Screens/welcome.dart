import 'package:flutter/material.dart';
import 'package:tourist/custom_button.dart';

void main() {
  runApp(const MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome To',
                style: TextStyle(
                    fontSize: 42,
                    // fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4280EF)),
              ),
              Text(
                'QuizApp',
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4280EF)),
              ),
              Text(
                'Let\'s get started',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Q',
                    style: TextStyle(
                        fontSize: 200,
                        // fontFamily: 'Plus Jakarta Sans-Bold',
                        color: Color(0xFF4280EF)),
                  )
                ],
              ),
              Text(
                'Sign in',
                style: TextStyle(
                  color: Color(0xFF4280EF),
                ),
              ),
              SizedBox(height: 10),
              CustomElevatedButton(buttonText: 'Student'),
              SizedBox(height: 10),
              CustomOutlinedButton(buttonText: 'Instructor'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('New To QuizApp?'),
                  Text(
                    'Sign up',
                    style: TextStyle(color: Color(0xFF4280EF)),
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
