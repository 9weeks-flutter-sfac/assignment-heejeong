import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "안녕하세요!\n간단하게 제 "
                ),
                TextSpan(
                  style: TextStyle(color: Colors.blue[600], fontSize: 18),
                  text: "소개"
                ),
                TextSpan(
                  text: "를 해보겠습니다\n\n"
                ),
                TextSpan(
                  text: "먼저 저의 MBTI는 "
                ),
                TextSpan(
                  style: TextStyle(color: Colors.red, fontSize: 18),
                  text: "INFJ"
                ),
                TextSpan(
                  text: "이고\n직업은 "
                ),
                TextSpan(
                  style: TextStyle(color: Colors.green[200], fontSize: 18),
                  text: "개발자"
                ),
                TextSpan(
                  text: "입니다\n\n"
                ),
                TextSpan(
                  style: TextStyle(
                    color: Colors.amber,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black),
                  text: "꿈"
                ),
                TextSpan(
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                  text: "은 없고요\n그냥 놀고싶습니다\n\n"
                ),
                TextSpan(
                  style: TextStyle(color: Colors.purple[400], fontSize: 18),
                  text: "감사합니다"
                ),
                
              ]),
            ),
        ),
      ),
    );
  }
}