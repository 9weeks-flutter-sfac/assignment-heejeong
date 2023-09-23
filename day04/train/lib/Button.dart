import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: DefaultTextStyle( //모든 자식 Text위젯 스타일 적용
          style: TextStyle(fontSize: 32, color: Colors.amber),
          child: Column(
            //Column의 특성상 자식들 중 하나가 Button으로 띄어져 있을 때
            //다른 자식들도 같이 띄어짐
            //버튼만 띄우기 위해 CrossAxisAlignment.start 작성
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.abc_sharp),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.abc_sharp)
              ),

              InkWell(
                //필수 속성. 이벤트 핸들러
                onTap: (){
                  print("안녕!!");  //콘솔에 출력
                },
                child: Text("안녕"),
              ),
              GestureDetector(
                //필수 속성. 이벤트 핸들러
                onTap: (){
                  print("안녕222"); //콘솔에 출력
                },
                child: Text("이벤트 가능?"),
              )
            ],
          )
        ),
      ),
      
    );
  }
}