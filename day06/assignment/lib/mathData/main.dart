// 과제 1. **주어진 데이터를 활용하여 제시되는 결과를 만드는 코드를 작성하시오.** 
// **(4-1과 4-2는 페이지 전환이 되도록 만드시오)**
// 4-1. 모든 요소를 아래와 같이 출력하시오. (색상은 Colors.amber)
// 4-2. 스크롤이 가능한 형태이며 모든 수를 대상으로 
// width : [수*2], height: 24 만큼의 크기를 가진 Container를 100개를 나열하는 코드를 작성하시오.


import 'package:assignment/mathData/main_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ListPage());
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SquareView(),
    );
  }
}

