import 'package:assignment/quizApp/quizCard.dart';
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
  List<Map<String, dynamic>> quizs = [
    {
      "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
      "answer": 2,
      "options": ["코", "눈썹", "귀", "머리카락"]
    },
    {
      "question": "다음 중 바다가 아닌 곳은?",
      "answer": 3,
      "options": ["카리브해", "오호츠크해", "사해", "지중해"]
    },
    {
      "question": "심청이의 아버지 심봉사의 이름은?",
      "answer": 2,
      "options": ["심전도", "심학규", "심한길", "심은하"]
    },
    {
      "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
      "answer": 4,
      "options": ["정단수", "육각수", "해모수", "인당수"]
    },
    {
      "question": "택시 번호판의 바탕색은?",
      "answer": 3,
      "options": ["녹색", "흰색", "노란색", "파란색"]
    }
  ];
  var myAns = [];
  // var optionIndex = 0;
  // 페이지의 80%만 화면에 보이도록 설정
  var pageController = PageController(viewportFraction: 0.8);

  void onCorrect(){
    myAns.add(Icons.circle_outlined);
  }
  void onIncorrect(){
    myAns.add(Icons.close);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //body를 appbar까지 확장
          extendBodyBehindAppBar: true,
          
          appBar: AppBar(
            leading: InkWell(
              onTap: () => pageController.previousPage(
                                      duration:
                                          Duration(milliseconds: 500),
                                      curve: Curves.easeIn),
              child: Icon(Icons.navigate_before)),
            actions: [InkWell(
              onTap: () => pageController.nextPage(
                                      duration:
                                          Duration(milliseconds: 500),
                                      curve: Curves.easeIn),
              child: Icon(Icons.navigate_next))],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myAns.map((iconData) {
                return Icon(iconData);
              }).toList(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          body: Container(
              // padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                  Colors.pinkAccent,
                  Colors.blue,
                ],
              )),

              child: PageView.builder(
                  // 스크롤 비활성화
                  physics: NeverScrollableScrollPhysics(), 
                  controller: pageController,
                  itemCount: quizs.length,
                  itemBuilder: (context, index) {

                    return Center(
                        child: QuizCard(
                          quiz: quizs[index],
                          onCorrect: onCorrect,
                          onIncorrect: onIncorrect,
                        )
                      );
            })),

          floatingActionButton:myAns.length == quizs.length ?
           FloatingActionButton(
            onPressed: (){
              myAns = [];
              pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              setState(() {});
            },
            child: Icon(Icons.refresh),
          ) : null,
      ),
    );
  }
}
