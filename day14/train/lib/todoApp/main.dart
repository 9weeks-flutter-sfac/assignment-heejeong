// required
// https://jsonplaceholder.typicode.com/todos
// - **반드시 Todo 클래스를 만들고 Serialization을 진행할 수 있도록 하시오.**
// - **AppBar는 다음의 조건을 따라 만들도록 하시오**
//     1. Blur 효과를 넣어 body의 내용이 흐릿하게 보여질 수 있도록 디자인하시오.
//     2. Actions에는 다음의 기능이 포함되어있는 아이콘을 제작하시오
//         - Filter 아이콘 :
//             - 클릭시 아래서 필터를 설정할 수 있도록 시트 위젯이 켜진다.
//             - 필터가 적용되면 화면에 보이는 데이터의 종류가 바뀐다.
//             - (필터선택시 아래에서 올라오는 안내문구는 선택사항임)
//         - Refresh 아이콘 :
//             - 클릭시 네트워크에 데이터를 한 번 더 요청하여 리스트에 재적용한다.
// - **각 Post를 보여주는 Widget은 다음의 조건을 따라 만들도록 하시오**
//     1. 완료된 상태의 Post라면, 초록색 배경에 체크버튼의 아이콘이 보여지도록 한다.
//     2. Dismissable 위젯을 활용하여 옆으로 슬라이드 했을 때, 리스트에서 사라지도록 한다.
//         1. **추가적으로, Dismissable 위젯의 key 속성이 의미하는 바를 정리하시오.**
// - **제공되는 소스코드를 활용할 수 있도록 하시오.**
//     - **widget/filter_bottom_sheet.dart**
//     - **widget/todo_card.dart**

import 'package:flutter/material.dart';
import 'package:train/todoApp/page/mainPage.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
