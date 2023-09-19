// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //세로를 기준으로 가운데 정렬
          children: [
            Text('오늘의 하루는', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
		        Text('어땠나요?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),

            // PageView의 사이즈와 모양을 설정하기 위해 Container 위제 사용
            Container(
              width: 200,
              height: 100,
              // 각 페이지마다 배경색 다른 PageView 만들기
              child: PageView(
                children:[
                  SizedBox.expand(
                    // 각 페이지마다 배경색 다르게 설정하기위해 Container 위젯 사용
                    child: Container(
                      child: Center(
                        child: Text(
                          '기쁨', style: TextStyle(fontFamily: 'Sunflower', color: Colors.white, fontSize: 23),
                        )
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                            Colors.green,
                            Colors.amber,
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox.expand(
                    // 각 페이지마다 배경색 다르게 설정하기위해 Container 위젯 사용
                    child: Container(
                      child: Center(
                        child: Text(
                          '슬픔', style: TextStyle(fontFamily: 'Sunflower', color: Colors.white, fontSize: 23),
                        )
                      ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                          Colors.red,
                          Color.fromARGB(255, 116, 193, 203),
                        ],
                      ),
                    ),
                    )
                  ),
                  SizedBox.expand(
                    // 각 페이지마다 배경색 다르게 설정하기위해 Container 위젯 사용
                    child: Container(
                      child: Center(
                        child: Text(
                          '상쾌', style: TextStyle(fontFamily: 'NanumPenScript', color: Colors.white, fontSize: 23),
                        )
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [  //LinearGradient 는 무조건 colors 값을 넣어줘야함
                            Colors.blue,
                            Colors.cyan,
                          ],
                        ),
                      ),
                    )
                  ),
                ]
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias, //자식에 있는 이미지를 부모의 데코레이션 속성에 맞춤
            ),

            // 위와 아래를 구분하는 구분선
            Divider(),

            // 여러 위젯을 한 블럭으로 설정하기 위해 Container 위젯 사용
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.blue ),
              child: Row(
                // List에 들어가는 타입을 Widget으로 명시
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(  
                      radius: 28, //크기
                      //provider 형태로 제공해야함으로 NetworkImage() 사용
                      backgroundImage: NetworkImage('https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/678/25404daf10e3d1b6926e86dcbc3463b8_res.jpeg')
                    ),
                  ),
                  Expanded(
                    flex: 2,  //다른 위젯의 공간보다 2배 크게 설정
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,  //세로(Main)를 기준으로 가운데 정렬
                        crossAxisAlignment: CrossAxisAlignment.start, //가로(Cross)를 기준으로 왼쪽에 마진을 주고 같은 지점에서 시작
                        children: [
                          Text('라이언', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                          Text('게임개발', style: TextStyle(color: Colors.white, fontSize: 12),),
                          Text('C#, Unity', style: TextStyle(color: Colors.white, fontSize: 12),),
                        ],
                      ),
                  ),
                  Expanded(child: Icon(Icons.add))
                ],
              ),
            )
          ]
        )
      )
    );
  }
}

