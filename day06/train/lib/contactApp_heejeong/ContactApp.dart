// # **Requirements**
// - 스크린 제외 두 페이지가 존재합니다.
//     - 연락처 상세보기 페이지, ContactDetailPage
//     - 메인페이지, MainPage
// - MainPage는 3개의 스크린을 가집니다.
//     - 연락처, ContactScreen
//     - 통화기록, HistoryScreen
//     - 설정, SettingScreen
// - BottomNavigationBar의 요소를 클릭시 해당 스크린으로 바뀌어 보여집니다.
// - ContactScreen의 커스텀위젯인 ContactTile을 누르면 연락처 상세보기 페이지로 이동됩니다.
// - ContactDetailPage 안에도 ContactTile 위젯이 포함되어 있습니다.

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

// import 'dart:html';
import 'dart:math';

import 'package:train/contactApp_heejeong/ContactDetailPage.dart';
import 'package:train/contactApp_heejeong/HistoryPage.dart';
import 'package:train/contactApp_heejeong/SettingPage.dart';
import 'package:flutter/material.dart';
import 'package:train/contactApp_heejeong/ContactTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

//stateful로 해야함. why??
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, String> contact = {
      '이테디' : '010-1111-2222',
      '밀리' : '010-3333-2222',
      '크리스' : '010-5555-4444',
      '주노' : '010-6666-2222',
      '혜리' : '010-1111-7777',
    };
    var selectIndex = 0;

    return Scaffold(
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
        body: ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context, index) {
            String name = contact.keys.elementAt(index);
            String phoneNumber = contact[name]!;
            // 랜덤 숫자 생성을 위한 Random 객체 생성
            Random random = Random();
            // 0 이상 99 이하의 난수 생성
            int randomNumber = random.nextInt(100);
            String imgUrl = 'https://picsum.photos/$randomNumber/$randomNumber';

            //커스텀 위젯 사용
            return InkWell(
              onTap: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) 
                      => ContactDetailPage(
                        name: name,
                        phoneNumber: phoneNumber,
                        imgUrl: imgUrl,
                      ))
                    );
              },
              child: ContactTile(
              name: name,
              phone: phoneNumber,
              imgUrl: imgUrl,
            ));
          },
        ),

        //바텀
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index){
            //탭한 index값을 현재index에 넣기
            selectIndex = index;
            //인덱스 값에 따른 페이지 이동
            if(index==0)
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp())
                    );
            if(index==1)
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage())
                    );
            if(index==2)
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage())
                    );
          },

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
    );
  }
}