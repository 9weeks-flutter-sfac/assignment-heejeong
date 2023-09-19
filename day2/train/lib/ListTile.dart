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
            ListTile(
              title: Text('아이디'),
              subtitle: Text("010-1111-2222"),
              leading: Padding( // 아이콘을 가운데로 맞춰주기 위해
                padding: const EdgeInsets.all(8.0), // 통상적으로 8을 띄움
                child: Icon(Icons.access_time),
              ),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              title: Text('아이디'),
              subtitle: Text("010-1111-2222"),
              leading: Padding( // 아이콘을 가운데로 맞춰주기 위해
                padding: const EdgeInsets.all(8.0), // 통상적으로 8을 띄움
                child: Icon(Icons.access_time),
              ),
              trailing: Icon(Icons.call),
            ),
          ]
        ),
      ),
      )
    );
  }
}