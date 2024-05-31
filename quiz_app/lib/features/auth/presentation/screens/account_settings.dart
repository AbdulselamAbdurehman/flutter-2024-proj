// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:quiz_app/features/auth/presentation/bloc/auth_state.dart';

void main() {
  runApp(const Settings());
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                    context.go('/');
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 31, color: Color(0xFF4280EF)),
                    ),
                    SizedBox(height: 30),
                    SettingsForm()
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _usernameController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Change Username',
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.length > 4) return null;
            return 'Username must be at least four chars';
          },
          controller: _usernameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'New Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Change Password',
        ),
        TextFormField(
          validator: (value) {
            if (_newPasswordController.text.isNotEmpty ||
                _confirmPasswordController.text.isNotEmpty ||
                (value != null && value.length < 5)) {
              return 'Set the Old Password';
            }
            return null;
          },
          controller: _oldPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Old Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextFormField(
          validator: (value) {
            if (_oldPasswordController.text.isNotEmpty ||
                _confirmPasswordController.text.isNotEmpty ||
                (value != null && value.length < 5)) {
              return "Set New Password";
            }
            return null;
          },
          controller: _newPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'New Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextFormField(
          validator: (value) {
            if (_oldPasswordController.text.isNotEmpty ||
                _newPasswordController.text.isNotEmpty) {
              if (value != null &&
                  _newPasswordController.text.isNotEmpty &&
                  _newPasswordController.text == value) {
                return null;
              }
              return 'Confirm the New Password';
            }
            return null;
          },
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Confirm Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 17),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4280EF),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_oldPasswordController.text.isNotEmpty &&
                      _newPasswordController.text.isNotEmpty &&
                      _confirmPasswordController.text.isNotEmpty &&
                      _newPasswordController.text ==
                          _confirmPasswordController.text &&
                      5 <= _confirmPasswordController.text.length &&
                      _confirmPasswordController.text.length <= 10) {
                    BlocProvider.of<AuthBloc>(context).add(
                      UpdatePasswordEvent(
                        params: UpdatePasswordParams(
                            newPassword: _newPasswordController.text,
                            oldPassword: _oldPasswordController.text),
                      ),
                    );
                  }
                  if (_usernameController.text.isNotEmpty) {
                    print('from account_settings.dart ' +
                        _usernameController.text);
                    BlocProvider.of<AuthBloc>(context).add(UpdateUsernameEvent(
                        newUsername: _usernameController.text));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
