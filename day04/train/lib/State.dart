import 'package:flutter/material.dart';
import 'package:train/TextField.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "안녕";
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            message = "반가워";
            setState((){});
          },
          child: Icon(Icons.change_circle),
        ),

        // body: Center(child: Text(message)),
        body: Center(
          child: InkWell(
            onTap: (){
              level += 1;
              setState(() {});
            },
            child: Text("현재 $level레벨 입니다"),
          ),
        )
      ),
    );
  }
}