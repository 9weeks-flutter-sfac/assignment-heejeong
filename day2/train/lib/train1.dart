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
          children:[
            Row(
              children:[
                Text('더하기 아이콘: '),
                Icon(Icons.add),
              ]
            ),
            Row(
              children:[
                Text('친구들 아이콘: '),
                Icon(Icons.people),
              ]
            ),
            Row(
              children:[
                Text('수정 아이콘: '),
                Icon(Icons.create),
              ]
            )]
          ),
          )
        ),
      );
  }
}