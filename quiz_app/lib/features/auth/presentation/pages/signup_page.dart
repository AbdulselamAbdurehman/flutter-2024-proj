import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const SignUpPage());
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/');
              },
            ),
            title: const Text('Back'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 31, color: Color(0xFF4280EF)),
                  ),
                  SizedBox(height: 20),
                  Text('Please create a new account'),
                  SizedBox(height: 10),
                  SignupForm()
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  void switchToRole(String role) {
    if (role == selectedRole) return;
    Color temp = studentRoleColor;
    studentRoleColor = instructorRoleColor;
    instructorRoleColor = temp;
    if (selectedRole == 'STUDENT') {
      selectedRole = 'INSTRUCTOR';
    } else {
      selectedRole = 'STUDENT';
    }
  }

  Color studentRoleColor = const Color(0xFF4280EF);
  Color instructorRoleColor = const Color(0xffffffff);
  String selectedRole = "STUDENT";
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  side: const BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFF4280EF)),
                  backgroundColor: studentRoleColor,
                  elevation: 0,
                ),
                onPressed: () => {
                  setState(() {
                    switchToRole('STUDENT');
                  })
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Student',
                    style: TextStyle(color: instructorRoleColor),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  side: const BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Color(0xFF4280EF)),
                  backgroundColor: instructorRoleColor,
                  elevation: 0,
                ),
                onPressed: () => {
                  setState(() {
                    switchToRole('INSTRUCTOR');
                  })
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Instructor',
                    style: TextStyle(color: studentRoleColor),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        const Text('Username'),
        TextField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text('Email'),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 13),
        const Text('Password'),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
              value: _agreedToTerms,
              onChanged: (newValue) {
                setState(() {
                  _agreedToTerms = true;
                });
              },
            ),
            const Flexible(
              child: Text(
                'I agree to the Terms of Service',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 29),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: const Color(0xFF4280EF),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Up',
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}












// class Button extends StatelessWidget {
//   final String title;
//   final Color color;
//   final Color textColor;
//   final VoidCallback onPressed;

//   const Button(
//       {super.key,
//       required this.onPressed,
//       required this.title,
//       required this.color,
//       required this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// void main() {
//   runApp(const SignUpPage());
// }

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 context.go('/');
//               },
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
//                     style: TextStyle(fontSize: 31, color: Color(0xFF4280EF)),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text('Please create a new account'),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.all(5),
//                             side: const BorderSide(
//                                 width: 1.0,
//                                 style: BorderStyle.solid,
//                                 color: Color(0xFF4280EF)),
//                             backgroundColor: const Color(0xFF4280EF),
//                             elevation: 0,
//                           ),
//                           onPressed: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'Student',
//                               style: TextStyle(color: Color(0xffffffff)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.all(5),
//                             side: const BorderSide(
//                                 width: 1.0,
//                                 style: BorderStyle.solid,
//                                 color: Color(0xFF4280EF)),
//                             backgroundColor: const Color(0xffffffff),
//                             elevation: 0,
//                           ),
//                           onPressed: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'Instructor',
//                               style: TextStyle(color: Color(0xFF4280EF)),
//                             ),
//                           ),
//                         ),
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
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(5),
//                   backgroundColor: const Color(0xFF4280EF),
//                   elevation: 0,
//                 ),
//                 onPressed: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(color: Color(0xffffffff)),
//                   ),
//                 ),
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

// // class Button extends StatelessWidget {
// //   final String title;
// //   final Color color;
// //   final Color textColor;
// //   final VoidCallback onPressed;

// //   const Button(
// //       {super.key,
// //       required this.onPressed,
// //       required this.title,
// //       required this.color,
// //       required this.textColor});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ;
// //   }
// // }

