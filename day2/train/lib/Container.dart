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
        child: Container(
          // color: Colors.indigo, //decoration 속성이 있을 때는 그 안에 넣어줘야함
          width: 300,
          height: 300,
          alignment: Alignment.center,  //child속성값의 Text위젯의 부모위젯가 center인 것과 동일
          margin: EdgeInsets.all(24),  //container 위치 값 변경
          padding: EdgeInsets.all(8), //container 내부 child 값의 위치 변경
          child: Text('아이디'),
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(),
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                Colors.red,
                Colors.blue,
              ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 8,
                  offset: Offset(0, 3),
                ),
              ]
          ),
          )
        ),
      ),
    );
  }
}