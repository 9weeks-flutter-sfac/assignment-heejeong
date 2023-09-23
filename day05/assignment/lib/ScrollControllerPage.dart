// 과제 2. ScrollController를 활용하여 가장 상단으로 이동하는 기능을 구현합니다.
// ListView.builder 위젯을 활용하여 높이가 300인 동물 위젯을 생성합니다.
// 하단의 FAB(FloatingActionButton)을 누르면, 스크롤 위치가 최상단으로 이동되게합니다.

import 'package:flutter/material.dart';

//ScrollController
//ListView.builder
//ListView.builder를 사용하는 이유는 
//화면에 보여지는 리스트들 그때그때 마다 호출하기 위해 사용합니다. 
//보이는 부분만 불러오기 때문에 ListView보다 효율적으로 화면을 구성할 수 있습니다. 
class ScrollControllerPage extends StatelessWidget {
  const ScrollControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    var scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('1번 문제'),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: animalList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 300,
            alignment: Alignment.center,
            child: Text(animalList[index])
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          scrollController.animateTo(
            //offset: 스크롤 위치를 조정하려는 목표 위치. 
            //0이면 스크롤 뷰의 맨 위로 이동,  
            //양수 값이면 아래로 스크롤, 음수 값이면 위로 스크롤
            0,  
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}