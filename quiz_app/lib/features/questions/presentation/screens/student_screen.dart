// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_bloc.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_event.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_state.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<int?> selectedOptionIndices = [];
  List<bool> showExplanations = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuestionBloc>(context).add(FetchQuestionsEvent());
  }

  void _handleOptionSelected(int questionIndex, int optionIndex) {
    setState(() {
      selectedOptionIndices[questionIndex] = optionIndex;
      showExplanations[questionIndex] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Solve Questions'),
        ),
        body: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded && state.questions.isNotEmpty) {
              final questions = state.questions;

              // Initialize the lists based on the number of questions if they are empty
              if (selectedOptionIndices.isEmpty) {
                selectedOptionIndices = List.filled(questions.length, null);
                showExplanations = List.filled(questions.length, false);
              }

              return Container(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    Question question = questions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.description,
                            // style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children:
                                question.options.asMap().entries.map((entry) {
                              int idx = entry.key;
                              String text = entry.value;
                              bool isSelected =
                                  selectedOptionIndices[index] == idx;
                              bool isCorrect =
                                  selectedOptionIndices[index] != null
                                      ? idx == question.answer
                                      : false;

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: OptionButton(
                                  onPressed: () =>
                                      _handleOptionSelected(index, idx),
                                  title: text,
                                  isSelected: isSelected,
                                  isCorrect: isSelected ? isCorrect : null,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          if (showExplanations[index])
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                question.explanation,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is QuestionError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No Questions Available'));
          },
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            if (index == 0) {
              context.push('/settings');
            } else if (index == 2) {
              context.push('/note');
            }
          },
          indicatorColor: Color(0xFF4280EF),
          selectedIndex: 1, // Set default selected index
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            NavigationDestination(
              icon: Icon(Icons.quiz),
              label: 'Solve Problems',
            ),
            NavigationDestination(
              icon: Icon(Icons.note),
              label: 'Notebook',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool? isCorrect;
  final bool isSelected;

  const OptionButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    if (isSelected) {
      backgroundColor = isCorrect == true ? Colors.green : Colors.red;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
