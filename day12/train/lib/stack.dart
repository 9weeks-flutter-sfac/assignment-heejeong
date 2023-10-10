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
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  width: 250,
                  height: 250,
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      //위에 있는 위젯과 색이 섞임
                      color: Colors.blue.withOpacity(0.4),
                      width: 200,
                      height: 200,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
