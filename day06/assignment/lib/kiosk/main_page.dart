import 'package:flutter/material.dart';
import 'package:assignment/kiosk/OptionCard.dart';
import 'package:assignment/kiosk/admin_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  List<String> myMenu=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: GestureDetector(
            //두번 클릭할 때, 이벤트 발생
            onDoubleTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => AdminPage()));
            }, 
            child: Text('분식왕 이테디 주문하기')
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주문 리스트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

                //Column안에 바로 ListView를 쓰면 사이즈에러 발생
                //높이 지정해줘야함
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: myMenu.isNotEmpty ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myMenu.length,
                    itemBuilder: (context, index){
                      return Chip(
                        label: Text(myMenu[index]),
                        onDeleted: (){myMenu.removeAt(index);setState(() {});},
                      );
                    }
                  ) : Text('주문한 내역이 없습니다.')
                ),

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
          )
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: myMenu.isNotEmpty 
          ? FloatingActionButton.extended(  //label 속성 추가하기 위해 '.extended' 사용
            onPressed: (){},
            label: Text('결제하기'),
          ) : null,
          //null을 넣으면 서서히 사라짐(애니메이션 효과 있음)
          //const SizedBox()를 넣으면 힌번에 딱 사라짐(애니메이션 효과 없음)

    );
  }
}


