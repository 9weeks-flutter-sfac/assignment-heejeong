import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /* body: Column(
          children: [
            ListTile(
              title: Text('1번 타일'),
            ),
            Divider(
              //구분선 위, 아래로 높이 적용
              height: 48,
              thickness: 4,
              //구분선의 처음과 끝의 길이를 조절
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text('2번 타일'),
            ),
          ],
        ), */

        //안좋은 예시
        //마지막 리스트 아래에 구분선이 들어감
        // body: ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index){
        //     return Column(
        //       children: [
        //         Text(index.toString()),
        //         Divider()
        //       ]
        //     );
        //   }
        // )

        //좋은 예시
        //마지막 리스트 아래에 구분선이 안들어감
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text(index.toString());
          },
          separatorBuilder: (context, index) {
            //3개씩 묶음
            if (index % 3 == 0) return Divider();
            return SizedBox();
          },
        ),
      ),
    );
  }
}
