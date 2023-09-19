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
        body: ListView(
          children: [
            Text('안녕 난 1번 ListView의 자식이다'),
            Text('나도! 1번 ListView의 자식이야'),
            ListView(
              children: [
                Text('난 2번의 자식임'),
                Text('나도 2번의 자식임'),
              ]
            ),
            Text('난 멀리 떨어져있지만 1번의 자식이야'),
          ]
        )
      )
    );
  }
}

// 에러 'Null check operator used on a null value' 가 나는 것으로 보아
// ListView 위젯에 null값이 들어있다는 것을 알 수 있다.
// 부모 ListView와 자식 ListView 위젯이 충돌하여 null값이 생기는 것 같다.
