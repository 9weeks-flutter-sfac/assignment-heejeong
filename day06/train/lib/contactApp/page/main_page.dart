import 'package:flutter/material.dart';
import 'package:train/contactApp/screen/contact_screen.dart';
import 'package:train/contactApp/screen/history_screen.dart';
import 'package:train/contactApp/screen/setting_screen.dart';
// import 'package:train/contactApp/widget/ContactTile.dart';

//stateful로 해야함. why??
//화면이 한 번 바뀌어야 하기 때문에
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  var selectIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        //body 내용만 바꾸게 설정
        body: [ContactScreen(), HistoryPage(), SettingPage()][selectIndex],

        //바텀
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index){
            //탭한 index값을 현재index에 넣기
            selectIndex = index;
            setState(() {});
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