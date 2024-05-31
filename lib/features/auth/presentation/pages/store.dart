// import 'package:flutter/material.dart';
// import 'package:new_app/home.dart';

// void main() {
//   runApp(const Settings());
// }

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {},
//             ),
//             actions: [
//               Button(
//                   onPressed: () {},
//                   title: 'Log Out',
//                   color: const Color(0xFF4280EF),
//                   textColor: const Color(0xffffffff))
//             ],
//             title: const Text(
//               'Home',
//               style: TextStyle(fontSize: 14),
//             ),
//           ),
//           body: Container(
//             padding: const EdgeInsets.all(20),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Question',
//                   style: TextStyle(fontSize: 25, color: Color(0xFF4280EF)),
//                 ),
//                 SizedBox(height: 30),
//                 QuestionForm()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuestionForm extends StatefulWidget {
//   const QuestionForm({super.key});

//   @override
//   State<QuestionForm> createState() => _QuestionFormState();
// }

// class _QuestionFormState extends State<QuestionForm> {
//   final _usernameController = TextEditingController();
//   final _oldPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Change Username',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         TextField(
//           controller: _usernameController,
//           keyboardType: TextInputType.text,
//           decoration: const InputDecoration(
//             hintText: 'New Username',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 13),
//         const Text(
//           'Change Password',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         TextField(
//           controller: _oldPasswordController,
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'Old Password',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 13),
//         TextField(
//           controller: _newPasswordController,
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'New Password',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 13),
//         TextField(
//           controller: _confirmPasswordController,
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'Confirm Password',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const SizedBox(height: 17),
//         Row(
//           children: [
//             Expanded(
//               child: Button(
//                 onPressed: () {},
//                 title: 'Save',
//                 color: const Color(0xFF4280EF),
//                 textColor: const Color(0xffffffff),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _oldPasswordController.dispose();
//     _newPasswordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
// }

//    onPressed: () {},
//                         title: 'Sign In',
//                         color: const Color(0xFF4280EF),
//                         textColor: const Color(0xffffffff),

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const Button(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5),
        side: const BorderSide(
            width: 1.0, style: BorderStyle.solid, color: Color(0xFF4280EF)),
        backgroundColor: color,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
