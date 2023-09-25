import 'package:flutter/material.dart';

void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
              return Text(index.toString());
            }
          )
        ),
      ),
    );
  }
}