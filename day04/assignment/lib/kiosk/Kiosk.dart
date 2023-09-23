// # Requirements
// 1. 음식을 누르면 주문 리스트에 담기는 키오스크앱을 만들어봅니다.
// 2. 음식이미지는 자유이며, 필요한 경우 위에 첨부된 파일을 이용하여도 됩니다.
// 3. 하단에 떠있는 버튼을 누르면 지금까지 주문된 주문 리스트를 초기화합니다.
// 4. 하단에 떠있는 버튼은 정중앙의 하단, 넓게 펴진 형태로 [ 초기화하기 ] 텍스트를 포함합니다.
// 5. 음식이 보여지는 것은 [갤러리] 형태로 보여지게 하며, 검색을 통해 해결합니다.
// 6. 그 외 UI 디자인은 자유입니다.

import 'package:assignment/kiosk/OptionCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var myMenu=[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('분식왕 이테디 주문하기'),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),

        body: Padding(
          padding: EdgeInsets.all(8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("주문 리스트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              Text(myMenu.toString()),
              SizedBox(height: 22),
              Text("음식", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

              //column/row 위젯은 main방향으로 계속 확장하려는 성질이 있음
              //GridView는 ListView와 비슷하게 스크롤이 있음
              //따라서 SizedBox/Container 위젯으로 main 사이즈 설정해줘야함
              //Container(
                // height: 300,

              //무조건 column/row 위젯 안에서 사용
              //expanded 위젯의 자식은 column/row가 가질 수 있는
              //모든 영역을 사용
              Expanded(
                child: GridView(
                  //한 행에 3개를 넣는다는 뜻
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    InkWell(
                      onTap: (){myMenu.add("떡볶이");setState(() {});},
                      child: OptionCard(
                      foodName:"떡볶이",
                      ImgUrl:"assets/images/option_bokki.png"
                    )
                    ),
                    InkWell(
                      onTap: (){myMenu.add("맥주");setState(() {});},
                      child: OptionCard(
                      foodName:"맥주",
                      ImgUrl:"assets/images/option_beer.png"
                    )),
                    InkWell(
                      onTap: (){myMenu.add("김밥"); setState((){});},
                      child: OptionCard(
                      foodName:"김밥",
                      ImgUrl:"assets/images/option_kimbap.png"
                    )),
                    InkWell(
                      onTap: (){myMenu.add("오므라이스"); setState((){});},
                      child: OptionCard(
                      foodName:"오므라이스",
                      ImgUrl:"assets/images/option_omurice.png"
                    )),
                    InkWell(
                      onTap: (){myMenu.add("돈까스"); setState((){});},
                      child: OptionCard(
                      foodName:"돈까스",
                      ImgUrl:"assets/images/option_pork_cutlets.png"
                    )),
                    InkWell(
                      onTap: (){myMenu.add("라면"); setState((){});},
                      child:OptionCard(
                      foodName:"라면",
                      ImgUrl:"assets/images/option_ramen.png"
                    )),
                    InkWell(
                      onTap: (){myMenu.add("우동"); setState((){});},
                      child:OptionCard(
                      foodName:"우동",
                      ImgUrl:"assets/images/option_udon.png"
                    )),
                  ],
                )
              )
              
            ],
          )
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(  //label 속성 추가하기 위해 '.extended' 사용
          onPressed: (){
            myMenu = [];
            setState((){});
          },
          label: Text('초기화하기'),
        ),

        ),
    );
  }
}


