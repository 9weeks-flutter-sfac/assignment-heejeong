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
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: Text('아이디'),
          ),
          )
        ),
      ),
    );
  }
}