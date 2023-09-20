// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

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
        appBar: AppBar(
          title: Text('플러터 굉장하다'),
          backgroundColor: Colors.transparent,  //투명하게
          elevation: 0,  //헤더에는 기본적으로 그림자가 있음. 그것을 없애줌
          centerTitle: true, //가운데 정렬 풀기
          foregroundColor: Colors.black,
          leading: Icon(Icons.access_time),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search)
            )
          ]
        ),
        body: Text('Fullter is th best'),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '장바구니')
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),	//아이콘 넣기
          mini: true,	//버튼 작게
          backgroundColor: Colors.black12,
          elevation: 0, //그림자 제거
        )
      ),
    );
  }
}