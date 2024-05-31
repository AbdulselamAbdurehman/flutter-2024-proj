// import 'package:flutter/material.dart';

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
//             title: const Text('Home'),
//           ),
//           body: Container(
//             padding: const EdgeInsets.all(20),
//             child: ListView(children: const [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Settings',
//                     style: TextStyle(fontSize: 42, color: Color(0xFF4280EF)),
//                   ),
//                   SizedBox(height: 30),
//                   LoginForm()
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
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
