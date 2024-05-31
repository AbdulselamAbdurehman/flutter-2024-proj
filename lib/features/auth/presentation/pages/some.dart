// import 'package:flutter/material.dart';

// void main() {
//   runApp(const QuestionPage());
// }

// class QuestionPage extends StatefulWidget {
//   const QuestionPage({super.key});

//   @override
//   State<QuestionPage> createState() => _QuestionPageState();
// }

// class _QuestionPageState extends State<QuestionPage> {
//   Question question = getQuestion();
//   int currentPageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           bottomNavigationBar: NavigationBar(
//             onDestinationSelected: (int index) {
//               setState(() {
//                 currentPageIndex = index;
//               });
//             },
//             indicatorColor: Colors.amber,
//             selectedIndex: currentPageIndex,
//             destinations: const <Widget>[
//               NavigationDestination(
//                 selectedIcon: Icon(Icons.settings),
//                 icon: Icon(Icons.settings),
//                 label: 'Settings',
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.add_circle),
//                 label: 'Add New Question',
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.note),
//                 label: 'Notebook',
//               ),
//             ],
//           ),
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {},
//             ),
//             title: const Text(
//               'Back',
//               style: TextStyle(fontSize: 14),
//             ),
//           ),
//           body: Container(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   width: double.infinity,
//                   color: Colors.blueGrey[100],
//                   child: Text(
//                     question.description,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: OptionButton(
//                       onPressed: () {},
//                       title: question.options[0],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: OptionButton(
//                       onPressed: () {},
//                       title: question.options[1],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: OptionButton(
//                       onPressed: () {},
//                       title: question.options[2],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: OptionButton(
//                       onPressed: () {},
//                       title: question.options[3],
//                     ),
//                   )
//                 ]),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Answer: ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(question.answer),
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Explanation',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     margin: const EdgeInsets.all(10),
//                     color: Colors.blueGrey[100],
//                     child: Text(question.explanation)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {},
//                       color: Colors.red,
//                     ),
//                     const SizedBox(width: 10),
//                     IconButton(
//                       icon: const Icon(Icons.edit),
//                       onPressed: () {},
//                       color: Colors.blue,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF4280EF),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OptionButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;

//   const OptionButton({
//     super.key,
//     required this.onPressed,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//           side: const BorderSide(color: Color(0xFF4280EF)),
//         ),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 16, color: Color(0xFF4280EF)),
//       ),
//     );
//   }
// }

// class Question {
//   String answer;
//   String explanation;
//   String description;
//   List<String> options;

//   Question({
//     required this.answer,
//     required this.explanation,
//     required this.options,
//     required this.description,
//   });
// }

// Question getQuestion() {
//   return Question(
//     answer: 'A',
//     explanation: 'Just for testing',
//     options: [
//       'the answer is A',
//       'the answer is B',
//       'the answer is C',
//       'the answer is D'
//     ],
//     description: 'Which one is the correct answer?',
//   );
// }

import 'package:flutter/material.dart';
import 'package:new_app/home.dart';

void main() {
  runApp(const Settings());
}

class Settings extends StatelessWidget {
  const Settings({super.key});

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
            actions: [
              Button(
                  onPressed: () {},
                  title: 'Log Out',
                  color: const Color(0xFF4280EF),
                  textColor: const Color(0xffffffff))
            ],
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question',
                  style: TextStyle(fontSize: 25, color: Color(0xFF4280EF)),
                ),
                SizedBox(height: 30),
                QuestionForm()
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _oldPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Old Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'New Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        TextField(
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
              child: Button(
                onPressed: () {},
                title: 'Save',
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
    _usernameController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
