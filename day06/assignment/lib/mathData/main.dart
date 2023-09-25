
import 'package:assignment/mathData/main_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ListPage());
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SquareView(),
    );
  }
}

