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
  double currentWidth = 400;
  // var currentWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: currentWidth,
                height: 400,
                // color: Colors.red,
                child: GestureDetector(
                  onTap: () {
                    currentWidth = currentWidth == 100 ? 400 : 100;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
