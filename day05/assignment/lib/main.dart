// 과제 1. 다음과 같이 버튼 [1번 과제], [2번 과제], [3번 과제]를 구성하고, 클릭 시 과제 페이지로 이동하도록 만드세요.

import 'package:assignment/MirroringPage.dart';
import 'package:assignment/SwitchingPage.dart';
import 'package:flutter/material.dart';
import 'package:assignment/ScrollControllerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AssignmentPage(),
    );
  }
}

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScrollControllerPage())
                  );
                }, 
                child: Text('1번 과제')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MirroringPage())
                  );
                }, 
                child: Text('2번 과제')
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwitchingPage())
                  );
                }, 
                child: Text('3번 과제')
              ),
            ],
          ),
        )
      ),
    );
  }
}

