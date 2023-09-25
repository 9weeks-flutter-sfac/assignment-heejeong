// # Requirements
// 1. 음식을 누르면 주문 리스트에 담기는 키오스크앱을 만들어봅니다.
// 2. 음식이미지는 자유이며, 필요한 경우 위에 첨부된 파일을 이용하여도 됩니다.
// 3. 하단에 떠있는 버튼을 누르면 지금까지 주문된 주문 리스트를 초기화합니다.
// 4. 하단에 떠있는 버튼은 정중앙의 하단, 넓게 펴진 형태로 [ 초기화하기 ] 텍스트를 포함합니다.
// 5. 음식이 보여지는 것은 [갤러리] 형태로 보여지게 하며, 검색을 통해 해결합니다.
// 6. 그 외 UI 디자인은 자유입니다.

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
  
