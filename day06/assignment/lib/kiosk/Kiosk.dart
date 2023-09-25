// # Requirements
// 1. 클릭시 메뉴가 주문 리스트에 담깁니다. 이 때 Chip 위젯으로 들어가게 됩니다.
//     - 각 Chip은 Delete 아이콘 버튼이 있으며, 클릭시 주문 리스트에서 삭제합니다.
// 2. 기존의 버튼은 **초기화하기**였으나**,** 동작하지 않는 **결제하기** 버튼으로 바뀝니다.
// 3. 주문 리스트가 비었다면, 하단의 **결제하기** 버튼이 표시되지 않습니다.
// 4. 앱바의 **분식왕 이테디 주문하기**를 더블클릭하면, 관리자 페이지로 이동하게 됩니다.

import 'package:flutter/material.dart';
import 'package:assignment/kiosk/main_page.dart';

void main() {
  runApp(const KioskApp());
}

class KioskApp extends StatelessWidget{
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MainPage()
    );
  }
}
  
