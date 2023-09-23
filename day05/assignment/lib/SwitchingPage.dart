// 과제 4. 다음의 UI를 구성하고 각각의 조건에 맞추어 코딩하시오.
// - Sun, Moon, Star라는 값이 있으며, 
// 오른쪽의 버튼을 눌렀을 때, 스위칭이 각각 될 수 있도록 함.
// - 이 때 스위칭이란, 활성화 여부를 뜻하며
// 불이 들어와 있을 땐 끄고, 꺼져있을 땐 켜는 것을 뜻함.
// - FAB를 클릭하면 모든 활성화되어있는 아이콘이 비활성화됨.

// 과제 4-1
// - “태양” 입력 후 “엔터(혹은 제출)”하였을 때, 달 아이콘의 색상이 스위칭이 되도록 함.
// - “달” 입력 후 “엔터(혹은 제출)”하였을 때, 달 아이콘의 색상이 스위칭이 되도록 함.
// - “별” 입력 후 “엔터(혹은 제출)”하였을 때, 달 아이콘의 색상이 스위칭이 되도록 함.

import 'package:flutter/material.dart';

class SwitchingPage extends StatefulWidget {
  const SwitchingPage({super.key});

  @override
  _SwitchingPageState createState() => _SwitchingPageState();
}

class _SwitchingPageState extends State<SwitchingPage> {
  // 각 ListTile의 아이콘 색상을 저장하는 맵
  Map<String, Color> iconColors = {
    'Sun': Colors.black,
    'Moon': Colors.black,
    'Star': Colors.black,
  };

  // 아이콘 색상 변경 함수
  void changeIconColor(String title, Color color) {
    setState(() {
      iconColors[title] = color;
    });
  }

  var icon = TextEditingController();
  var iconName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Sun'),
            leading: Icon(Icons.sunny, color: iconColors['Sun']),
            trailing: IconButton(
              onPressed: () {
                // IconButton을 눌렀을 때 아이콘 색상 변경
                changeIconColor(
                  'Sun', 
                  iconColors['Sun'] == Colors.black ?
                  Colors.red : Colors.black 
                );
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          ListTile(
            title: Text('Moon'),
            leading: Icon(Icons.nightlight_round, color: iconColors['Moon']),
            trailing: IconButton(
              onPressed: () {
                // IconButton을 눌렀을 때 아이콘 색상 변경
                changeIconColor(
                  'Moon', 
                  iconColors['Moon'] == Colors.black ?
                  Colors.yellow : Colors.black 
                );
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          ListTile(
            title: Text('Star'),
            leading: Icon(Icons.star, color: iconColors['Star']),
            trailing: IconButton(
              onPressed: () {
                // IconButton을 눌렀을 때 아이콘 색상 변경
                changeIconColor(
                  'Star', 
                  iconColors['Star'] == Colors.black ?
                  Colors.yellow : Colors.black 
                );
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),

          TextField(
            autofocus: true, // TextField를 탭하면 자동으로 포커스를 줘서 키패드가 나오도록 함
            decoration: InputDecoration(
              hintText: '키고 끄고 싶은 아이콘을 입력하세요',
              border: OutlineInputBorder()
            ),

            controller: icon,
            // 엔터(리턴) 키를 눌렀을 때 이벤트를 실행
            onSubmitted: (value){
              //한글로 작성할 때 영어로 바꿔줌
              if(icon.text == '태양')
                iconName = 'Sun';
              if(icon.text == '달')
                iconName = 'Moon';
              if(icon.text == '별')
                iconName = 'Star';
              
              //icon에 따른 색 변화
              changeIconColor(
                  iconName == ''?icon.text:iconName, 
                  iconColors[iconName] == Colors.black ?
                  (iconName == 'Sun' ? Colors.red : 
                  Colors.yellow) : Colors.black 
                );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeIconColor('Sun', Colors.black);
          changeIconColor('Moon', Colors.black);
          changeIconColor('Star', Colors.black);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
