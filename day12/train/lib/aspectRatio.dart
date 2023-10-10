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
  double row = 1;
  double column = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: row / column,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    width: 100,
                    height: 400,
                    child: GestureDetector(
                      onTap: () {
                        row = row == 1 ? 4 : 1;
                        column = column == 1 ? 3 : 1;
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.red,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
