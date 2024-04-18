import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: const Text(
            'Back',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white, // Set AppBar background color
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'QuizApp',
                style: TextStyle(
                  color: Color(0xFF1e88e5),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Sign in to QuizApp',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            // Username or Email
            const SizedBox(
              height: 30,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Username or Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: ListTile(
                    title: Text(
                      'myemail@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: ListTile(
                    title: Text(
                      '........',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.visibility_off,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            // Password

            const SizedBox(
              height: 30,
            ),
            // Sign in buttons
            SizedBox(
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  // Add your sign in logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976d2),
                  padding:
                      const EdgeInsets.all(16.0), // Add padding to all sides
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ), // Button color
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90), // Add spacing between buttons
            SizedBox(
              width: 360,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Add your sign in with Google logic here
                },
                icon: const Icon(
                  Icons.facebook_rounded,
                  color: Colors.blue,
                ), // Google icon
                label: const Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, // Text color
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                  padding:
                      const EdgeInsets.all(16.0), // Add padding to all sides
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ), // Border color
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            SizedBox(
              width: 360,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Add your sign in with Facebook logic here
                },
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ), // Facebook icon
                label: const Text(
                  'Sign in with Facebook',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, // Text color
                  side: const BorderSide(color: Colors.blue),
                  padding:
                      const EdgeInsets.all(16.0), // Add padding to all sides
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ), // Border color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
