import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
        child: PageView(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Text('1번 페이지'),
              color: Colors.amber,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                  Colors.red,
                  Colors.blue,
                ],
              ),
              ),
              ),
            Text('2번 페이지'),
            Text('3번 페이지'),
          ],
        )
        ),
      ),
    );
  }
}