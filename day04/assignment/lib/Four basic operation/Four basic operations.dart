//조건
// - TextField를 두 개 사용하여 변수에 저장합니다.
// - 사칙연산이 가능하도록 버튼을 4개 만듭니다. 각각의 버튼(+,-,*,/)를 누르면 해당 연산자에 맞는 결과값을 출력합니다.
// - 이 때, 결과값은 **다이얼로그(Dialog)**로 출력합니다.
// Dialog란, 앱에서 팝업창처럼 화면위에 화면을 띄우는것을 말합니다. 
// 일반적으로 showDialog가 있고, AlertDialog를 주로 사용합니다.
// - 계산 결과를 result로 넣으면, 다이얼로그를 출력하는 예시코드가 제공됩니다. 
// 해당 코드를 활용하여 결과를 화면에 출력하세요.

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:assignment/Four basic operation/Bottom.dart';
import 'package:assignment/Four basic operation/OperationButton.dart';
import 'package:assignment/Four basic operation/SlideThree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//다이얼로그를 루트 위젯에서 사용하게 되면 에러가 발생
//루트 위젯을 따로 MyApp 위젯으로 
//MaterialApp 위젯을 반환하는 형태로 만들
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // State<showResult> createState() => _showResultState();
  Widget build(BuildContext context) {
    return MaterialApp(home: showResult(),);
  }
}

//statefulWidget으로 하기 위해 추가 작성
//statefulWidget으로 안해도 상관X
class showResult extends StatefulWidget {
  const showResult({super.key});

  @override
  State<showResult> createState() => _MyAppState();
}

//statelessWidget으로 하면 
//return MaterialApp(home: showResult(),); 에서 작성한 showResult 를 클래스명을 하여
//class _MyAppState extends State<showResult> 대신
//class showResult extends StatelessWidget 으로 작성하면 된다

class _MyAppState extends State<showResult> {
  var num_x;
  var num_y;
  var result;
  bool click=false;

  //결과값을 다이얼로그로 출력
  //Dialog란, 앱에서 팝업창처럼 화면위에 화면을 띄우는것
  showResultDialog(BuildContext context, var result) {
    showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 150,
              child: Center(
                child: Text("$result", 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ),
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("사칙연산"),
          centerTitle: true,
        ),

        body: Padding(
          // padding: EdgeInsets.only(left: 18),
          padding: EdgeInsets.only(left: 18, top: 30),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("x의 값은?"),
                  SizedBox(width: 49,),
                  Container(
                    width: 155,
                    height: 50,

                    //변수에 입력 값 저장
                    //textfield 클릭 시, bottom&bottomsheet 속성 변경하는 법 모르겠음
                    child: TextField(
                      onChanged: (num){
                          
                          //숫자로 바뀌지 않음. 이유??
                          // num_x = int.parse(num);
                          num_x = num;
                          setState(() {click = true;});
                      },
                      //이거 사용해도 숫자로 안바뀜
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("x값을 입력하세요."),
                        //textfield 입력 시, 라벨 없애기
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        //label 대신 hintText 속성 사용하면 됌
                        
                        // 테두리
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        )
                      ),
                    )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("y의 값은?"),
                  SizedBox(width: 49,),
                  Container(
                    width: 155,
                    height: 50,

                    //변수에 입력값 저장
                    child: TextField(
                      onChanged: (num){
                        
                        num_y = num;
                        setState(() {click = true;});
                      },
                      decoration: InputDecoration(
                        label: Text("y값을 입력하세요."),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)
                        )
                      ),
                    )
                  )
                ],
              ),

              SizedBox(height: 5,),

              // 같은 기능
              // ElevatedButton(
              //   onPressed: () {
              //     showResultDialog(context, x + y);
              //   },
              //   child: Text('더하기의 결과값은?!'),
              // ),

              GestureDetector(
                onTap: (){
                  //int.parse(): 문자(열)을 숫자로 바꿈
                  result = int.parse(num_x) + int.parse(num_y);
                  showResultDialog(context, result);
                  print(result);
                  setState(() {});
                },
                child: OperationButton(text: "더하기")
              ),
              GestureDetector(
                onTap: (){
                  result = int.parse(num_x) * int.parse(num_y);
                  showResultDialog(context, result);
                  print(result);
                  setState(() {});
                },
                child: OperationButton(text: "곱하기")
              ),
              GestureDetector(
                onTap: (){
                  result = int.parse(num_x) - int.parse(num_y);
                  showResultDialog(context, result);
                  print(result);
                  setState(() {});
                },
                child: OperationButton(text: "빼기")
              ),
              GestureDetector(
                onTap: (){
                  result = int.parse(num_x) / int.parse(num_y);
                  showResultDialog(context, result);
                  print(result);
                  setState(() {});
                },
                child: OperationButton(text: "나누기")
              ),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 50,
          child: click == false ? BaseBottom() : KeypadBottom()
          // BottomNavigationBar(
          //   iconSize: 17,
          //   // backgroundColor: Colors.black,
          //   backgroundColor: Colors.black54,
          //   elevation: 0,
          //   type: BottomNavigationBarType.fixed,
          //   fixedColor: Colors.grey,
          //   unselectedItemColor: Colors.grey,

          //   //item의 라벨을 없애기 위해서는 무조건 속성으로 설정해야함
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,

          //   items: [
          //     // BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios_new_outlined), label: ''),
          //     BottomNavigationBarItem(icon: Icon(Icons.keyboard_double_arrow_down_sharp), label: ''),
          //     BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: ''),
          //     BottomNavigationBarItem(icon: Icon(Icons.crop_square_outlined), label: ''),
          //     BottomNavigationBarItem(icon: Icon(Icons.keyboard_alt_outlined), label: ''),
          //   ],
          // )
        ),

        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min, 
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SlideThree(first: "1", second: "2", third: "3"),
            SlideThree(first: "4", second: "5",third: "6"),
            SlideThree(first: "7", second: "8", third: "9"),
            Container(
                height: 58,
                color: Colors.white,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: double.infinity,
                    width: (MediaQuery.of(context).size.width)/3,
                    padding: EdgeInsets.fromLTRB(0,0,1,1),
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Icon(Icons.backspace_outlined, color: Colors.white,),
                      decoration: BoxDecoration(
                        color: Colors.black54
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: (MediaQuery.of(context).size.width)/3,
                    padding: EdgeInsets.fromLTRB(0,0,1,1),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("0", style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.black54
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: (MediaQuery.of(context).size.width)/3,
                    padding: EdgeInsets.only(bottom: 1),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('완료', style: TextStyle(color: Colors.green),),
                      decoration: BoxDecoration(
                        color: Colors.black54
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                  ),
                ],
              )
            )
          ],
        ),
        
      ),
      );
  }
}
