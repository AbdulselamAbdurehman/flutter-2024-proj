// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_bloc.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_event.dart';
import 'package:quiz_app/features/questions/presentation/bloc/question_state.dart';

class QuestionForm extends StatefulWidget {
  final Question? question;
  final bool edit;

  const QuestionForm({this.question, this.edit = false, super.key});

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _optionAController = TextEditingController();
  final _optionBController = TextEditingController();
  final _optionCController = TextEditingController();
  final _optionDController = TextEditingController();
  final _answerController = TextEditingController();
  final _explanationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.edit && widget.question != null) {
      _descriptionController.text = widget.question!.description;
      _optionAController.text = widget.question!.options[0];
      _optionBController.text = widget.question!.options[1];
      _optionCController.text = widget.question!.options[2];
      _optionDController.text = widget.question!.options[3];
      _answerController.text = widget.question!.answer.toString();
      _explanationController.text = widget.question!.explanation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/instructor_screen');
            },
          ),
          title: Text(widget.edit ? 'Update Question' : 'Submit Question'),
          centerTitle: true,
        ),
        body:
            BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(9),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    const Text(
                      'Options',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _optionAController,
                      decoration: const InputDecoration(
                        hintText: 'option A',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter option A';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _optionBController,
                      decoration: const InputDecoration(
                        hintText: 'option B',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter option B';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _optionCController,
                      decoration: const InputDecoration(
                        hintText: 'option C',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter option C';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: _optionDController,
                      decoration: const InputDecoration(
                        hintText: 'option D',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter option D';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    const Text(
                      'Answer',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _answerController,
                      decoration: const InputDecoration(
                        hintText: 'Correct Answer Index (0=A, 1=B, 2=C, 3=D)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            !['0', '1', '2', '3'].contains(value)) {
                          return 'Please enter a valid answer index (0-3)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 13),
                    const Text(
                      'Explanation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _explanationController,
                      decoration: const InputDecoration(
                        hintText: 'Brief explanation',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please brief explanation'
                          : null,
                    ),
                    const SizedBox(height: 31),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.edit) {
                                  final updatedQuestion = Question(
                                      questionNumber:
                                          widget.question!.questionNumber,
                                      answer: int.parse(_answerController.text),
                                      description: _descriptionController.text,
                                      explanation: _explanationController.text,
                                      options: [
                                        _optionAController.text,
                                        _optionBController.text,
                                        _optionCController.text,
                                        _optionDController.text
                                      ]);
                                  BlocProvider.of<QuestionBloc>(context).add(
                                      UpdateQuestionEvent(updatedQuestion));
                                } else {
                                  final newQuestion = Question(
                                    description: _descriptionController.text,
                                    options: [
                                      _optionAController.text,
                                      _optionBController.text,
                                      _optionCController.text,
                                      _optionDController.text,
                                    ],
                                    answer: int.parse(_answerController.text),
                                    explanation: _explanationController.text,
                                  );
                                  BlocProvider.of<QuestionBloc>(context)
                                      .add(CreateQuestionEvent(newQuestion));
                                }
                                context.go('/instructor_screen');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.edit ? 'Update' : 'Submit',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
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
