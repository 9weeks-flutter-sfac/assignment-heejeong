// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:train/ContactTile.dart';

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
        //헤더
        appBar: AppBar(
          title: Text('내 연락처'),
          elevation: 0,  //헤더에는 기본적으로 그림자가 있음. 그것을 없애줌
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz)
            )
          ]
        ),

        //SafeArea
        body: ListView(
          children: [
            // ListTile(
            //   title: Text('이테디'),
            //   subtitle: Text('010-1111-2222'),
            //   leading: CircleAvatar(
            //     backgroundImage: NetworkImage('https://picsum.photos/100/100'),
            //   ),
            //   trailing: Icon(Icons.call),
            // ),
            // ListTile(
            //   title: Text('몰리'),
            //   subtitle: Text('010-3333-2222'),
            //   leading: CircleAvatar(
            //     backgroundImage: NetworkImage('https://picsum.photos/10/10'),
            //   ),
            //   trailing: Icon(Icons.call),
            // ),

            //커스텀 위젯 사용
            ContactTile(
              name: '이테디',
              phone: '010-1111-2222',
              imgUrl: 'https://picsum.photos/100/100',
            ),
            ContactTile(
              name: '몰리',
              phone: '010-3333-2222',
              imgUrl: 'https://picsum.photos/10/10',
            ),
            ContactTile(
              name: '이데',
              phone: '010-1111-4444',
              imgUrl: 'https://picsum.photos/130/130',
            ),
          ],
        ),

        //바텀
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: '연락처'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '통화기록'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
          ]
        ),

        //하단 추가 기능
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),	//아이콘 넣기
          mini: true,	//버튼 작게
        )
      ),
    );
  }
}