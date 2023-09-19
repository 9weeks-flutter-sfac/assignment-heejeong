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
        child: Column(
          children: [
            Image.network(
              'https://plus.unsplash.com/premium_photo-1692196626145-40ceca0e504b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1854&q=80'
              ),
            Image.asset('assets/images/스크린샷(179).png')
            ]
        )
        ),
      ),
    );
  }
}