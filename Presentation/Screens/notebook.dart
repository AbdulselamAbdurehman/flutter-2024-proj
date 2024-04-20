import 'package:flutter/material.dart';
import 'package:quizzy/reusable.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: getCustomAppBar('Home'),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  'Notebook',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  color: const Color(0xFFE1E1E1),
                  child: const Text(
                      'Organize thoughts, Capture ideas, tasks, and inspiration seamlessly. Enhance productivity with customizable formatting, tagging, and easy sharing across devices for streamlined collaboration'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                    const SizedBox(width: 10)
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
