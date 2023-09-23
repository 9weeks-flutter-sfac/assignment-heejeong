import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            //이전 페이지 가기
            // pageController.previousPage(duration: duration, curve: curve)

            //다음 페이지 가기
            pageController.nextPage(
              //페이지 넘어가는데 걸리는 시간
              duration: Duration(milliseconds: 500), 
              //넘어가는 방법
              curve: Curves.easeIn
            );
          },
          child: Icon(Icons.navigate_next_rounded),
        ),

        body: DefaultTextStyle(
          style: TextStyle(fontSize: 36, color: Colors.black),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: PageView(
                //사용자가 swipe 못함
                //floatingActionButton 이벤트는 실행 가능
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Text('A페이지'),
                  Text('B페이지'),
                  Text('C페이지'),
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}
