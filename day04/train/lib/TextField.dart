// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _handleOnChanged(String value){
    print(value);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: TextField(
          decoration: InputDecoration(
            label: Text("이메일 입력"),
            labelStyle: TextStyle(color: Colors.green),
            hintText: "example@email.com",
            fillColor: Colors.black12,
            filled: true,
          ),

          //input박스에 하나 입력할 때마다 콘솔에 출력됨
          // onChanged: (value){
          //   print(value);
          // },

          //_handleOnChanged 함수 사용시, 뒤에 '()' 붙이면 안됌
          //'()'는 바로 실행하겠다는 의미
          // onChanged: _handleOnChanged(),
          onChanged: _handleOnChanged,

        ),
      ),
    );
  }
}
