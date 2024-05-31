// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/features/notes/domain/entities/note.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_bloc.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_event.dart';
import 'package:quiz_app/features/notes/presentation/bloc/note_state.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _updateFormKey = GlobalKey<FormState>();
  final _updatedNoteTextController = TextEditingController();
  final _newFormKey = GlobalKey<FormState>();
  final _newNoteTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteBloc>(context).add(GetNoteEvent());
  }

  @override
  void dispose() {
    _updatedNoteTextController.dispose();
    _newNoteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: BlocConsumer<NoteBloc, NoteState>(
          listener: (context, state) {
            if (state is NoteCreated || state is NoteUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Note has been ${state is NoteCreated ? 'created' : 'updated'} successfully.')),
              );
              BlocProvider.of<NoteBloc>(context).add(GetNoteEvent());
            }
          },
          builder: (context, state) {
            return _buildBody(context, state);
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text('Notebook'),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context, NoteState state) {
    if (state is NoteLoading) {
      return _buildLoading();
    } else if (state is NoteLoaded) {
      return _buildUpdateNoteForm(state);
    } else if (state is NoteError) {
      return _buildNewNoteForm();
    } else {
      return _buildErrorFeedback();
    }
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildUpdateNoteForm(NoteLoaded state) {
    _updatedNoteTextController.text = state.note.noteText;

    return Form(
      key: _updateFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notebook', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            TextFormField(
              controller: _updatedNoteTextController,
              decoration: InputDecoration(
                hintText: 'Your note here',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Write some note to save';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNewNoteForm() {
    return Form(
      key: _newFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notebook', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            TextFormField(
              controller: _newNoteTextController,
              decoration: InputDecoration(
                hintText: 'Your note here',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Write some note to be added';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            _buildCreateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: const Color(0xFF4280EF),
        ),
        onPressed: () {
          if (_updateFormKey.currentState!.validate()) {
            BlocProvider.of<NoteBloc>(context).add(
              UpdateNoteEvent(Note(
                noteText: _updatedNoteTextController.text,
              )),
            );
          }
        },
        child: const Text(
          'Save Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: const Color(0xFF4280EF),
        ),
        onPressed: () {
          if (_newFormKey.currentState!.validate()) {
            BlocProvider.of<NoteBloc>(context).add(
              CreateNoteEvent(Note(
                noteText: _newNoteTextController.text,
              )),
            );
          }
        },
        child: const Text(
          'Create Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildErrorFeedback() {
    return Center(
      child: Text('Problem Occurred. Check back later'),
    );
  }
}
