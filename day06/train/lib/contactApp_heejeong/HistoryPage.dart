import 'dart:math';

import 'package:train/contactApp_heejeong/ContactApp.dart';
import 'package:train/contactApp_heejeong/SettingPage.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectIndex = 1;
    var names = ['이테디', '밀리','크리스', '주노', '혜리'];
    var icons = [Icons.call_made, Icons.call_missed, Icons.call_received];

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

        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            // 랜덤 숫자 생성을 위한 Random 객체 생성
            Random random = Random();
            // 0 이상 99 이하의 난수 생성
            int randomName = random.nextInt(names.length);
            int randomIcon = random.nextInt(icons.length);

            return ListTile(
              title: Text(names[randomName]),
              trailing: Icon(icons[randomIcon]),
            );
          }
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


