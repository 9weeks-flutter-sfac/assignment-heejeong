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
        child: Padding(
          padding: EdgeInsets.all(8), //통상적으로 8을 사용
          child: Text('아이디'),
          )
        ),
      ),
    );
  }
}