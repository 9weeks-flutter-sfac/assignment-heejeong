import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Wrap(
          //열의 마진
          spacing: 8,
          //행의 마진
          runSpacing: 8,
          children: [
            Container(
              color: Colors.red,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.orange,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.yellow,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.green,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.blue,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.indigo,
              width: 90,
              height: 40,
            ),
            Container(
              color: Colors.purple,
              width: 90,
              height: 40,
            ),
          ],
        )),
      ),
    );
  }
}
