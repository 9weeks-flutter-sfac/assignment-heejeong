
import 'package:train/contactApp_heejeong/ContactApp.dart';
import 'package:train/contactApp_heejeong/HistoryPage.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectIndex = 2;

    return Scaffold(
        //헤더
        appBar: AppBar(
          //leading부분에 back아이콘 자동으로 생성 안하고 싶을 때 작성
          automaticallyImplyLeading: false,
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

        body: ListView(
          children: [
            ListTile(
              title: Text('차단목록'),
            ),
            ListTile(
              title: Text('벨소리설정'),
            ),
            ListTile(
              title: Text('전화통계'),
            ),
          ]
        ),

        //바텀
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index){
            selectIndex = index;
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


