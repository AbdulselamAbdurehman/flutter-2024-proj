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
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Notebook',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  color: Color(0xFFF5F5F5),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat mauris non quam faucibus, ac blandit nunc convallis. Nulla facilisi. Fusce interdum velit nec tellus convallis, vitae fermentum risus fringilla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed vel justo nec justo aliquam faucibus.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      icon: Icon(Icons.edit_document),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
