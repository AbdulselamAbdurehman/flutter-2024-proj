import 'package:flutter/material.dart';
import 'package:new_app/home.dart';

void main() {
  runApp(const NewQuestion());
}

class NewQuestion extends StatelessWidget {
  const NewQuestion({super.key});

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
            title: const Text('Home'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Question',
                      style: TextStyle(fontSize: 25, color: Color(0xFF4280EF)),
                    ),
                    SizedBox(height: 10),
                    QuestionForm()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionForm extends StatefulWidget {
  const QuestionForm({super.key});

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final _descriptionController = TextEditingController();
  final _optionAController = TextEditingController();
  final _optionBController = TextEditingController();
  final _optionCController = TextEditingController();
  final _optionDController = TextEditingController();
  final _answerController = TextEditingController();
  final _explanationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _descriptionController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'description',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _optionAController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'option A',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextField(
          controller: _optionBController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'option B',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextField(
          controller: _optionCController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'option C',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextField(
          controller: _optionDController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'option D',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Answer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _answerController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Correct Answer(A, B, C or D)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Explanation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _explanationController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Brief explanation',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 31),
        Row(
          children: [
            Expanded(
              child: Button(
                onPressed: () {},
                title: 'Submit',
                color: const Color(0xFF4280EF),
                textColor: const Color(0xffffffff),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _answerController.dispose();
    _optionAController.dispose();
    _optionBController.dispose();
    _optionCController.dispose();
    _optionDController.dispose();
    _explanationController.dispose();
    super.dispose();
  }
}
