import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //opacity 속성 값은 double 로 설정해줘야함
  // double currentOpacity = 1;
  var currentOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: currentOpacity,
                duration: Duration(microseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    currentOpacity = currentOpacity == 0 ? 1 : 0;
                    setState(() {});
                  },
                  child: Text(
                    '안녕하세요',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
