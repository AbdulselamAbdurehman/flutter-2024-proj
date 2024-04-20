import 'package:flutter/material.dart';
import 'reusable.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: getCustomAppBar('Home'),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_circle,
                        size: 30, color: Color(0xFF4280EF)),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 15),
                  const Text('New Notebook',
                      style: TextStyle(fontSize: 20, color: Colors.black))
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
