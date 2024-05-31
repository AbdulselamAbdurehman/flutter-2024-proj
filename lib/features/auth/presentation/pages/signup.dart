// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SignUp());
// }

// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

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
//             title: const Text('Back'),
//           ),
//           body: Container(
//             padding: const EdgeInsets.all(20),
//             child: ListView(children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Sign Up',
//                     style: TextStyle(fontSize: 42, color: Color(0xFF4280EF)),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text('Please create a new account'),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         child: Button(
//                             onPressed: () {},
//                             title: 'Student',
//                             color: const Color(0xFF4280EF),
//                             textColor: const Color(0xffffffff)),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Button(
//                             onPressed: () {},
//                             title: 'Instructor',
//                             color: const Color(0xffffffff),
//                             textColor: const Color(0xFF4280EF)),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//                   const SignupForm()
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignupForm extends StatefulWidget {
//   const SignupForm({super.key});

//   @override
//   State<SignupForm> createState() => _SignupFormState();
// }

// class _SignupFormState extends State<SignupForm> {
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _agreedToTerms = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Username'),
//         TextField(
//           controller: _usernameController,
//           keyboardType: TextInputType.text,
//           decoration: const InputDecoration(
//             hintText: 'Username',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 13),
//         const Text('Email'),
//         TextField(
//           controller: _emailController,
//           keyboardType: TextInputType.emailAddress,
//           decoration: const InputDecoration(
//             hintText: 'Email',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 13),
//         const Text('Password'),
//         TextField(
//           controller: _passwordController,
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'Password',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Checkbox(
//               value: _agreedToTerms,
//               onChanged: (newValue) {
//                 setState(() {
//                   _agreedToTerms = true;
//                 });
//               },
//             ),
//             const Flexible(
//               child: Text(
//                 'I agree to the Terms of Service',
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 29),
//         Row(
//           children: [
//             Expanded(
//               child: Button(
//                 onPressed: () {},
//                 title: 'Sign Up',
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
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
