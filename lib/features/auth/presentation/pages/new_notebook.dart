import 'package:flutter/material.dart';

void main() {
  runApp(const Notebook());
}

class Notebook extends StatelessWidget {
  const Notebook({super.key});

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
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 31,
                        Icons.add_circle,
                        color: Color(0xFF4280EF),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('New Notebook')
                ],
              ),
            )),
      ),
    );
  }
}
