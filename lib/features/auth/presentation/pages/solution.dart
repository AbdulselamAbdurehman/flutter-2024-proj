import 'package:flutter/material.dart';

void main() {
  runApp(const QuestionPage());
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Question question = getQuestion();
  int currentPageIndex = 0;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  question.description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: OptionButton(
                      onPressed: () {},
                      title: question.options[0],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: OptionButton(
                      onPressed: () {},
                      title: question.options[1],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: OptionButton(
                      onPressed: () {},
                      title: question.options[2],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: OptionButton(
                      onPressed: () {},
                      title: question.options[3],
                    ),
                  )
                ]),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4280EF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_circle),
                label: 'Add new Question',
              ),
              NavigationDestination(
                icon: Icon(Icons.note),
                label: 'Notebook',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const OptionButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF4280EF)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Color(0xFF4280EF)),
      ),
    );
  }
}

class Question {
  String answer;
  String explanation;
  String description;
  List<String> options;

  Question({
    required this.answer,
    required this.explanation,
    required this.options,
    required this.description,
  });
}

Question getQuestion() {
  return Question(
    answer: 'A',
    explanation: 'Just for testing',
    options: [
      'the answer is A',
      'the answer is B',
      'the answer is C',
      'the answer is D'
    ],
    description: 'Which one is the correct answer?',
  );
}
