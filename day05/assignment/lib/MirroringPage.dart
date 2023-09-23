// 과제 3. 입력된 텍스트 미러링하는 화면을 제작합니다.
// - TextField에 입력시, 바로 밑에 위치한 하단의 Text위젯에 똑같이 적용되도록 합니다.
// - FAB(FloatingActionButton)을 클릭하면, 작성중이던 모든 내용이 사라집니다.

import 'package:flutter/material.dart';

class MirroringPage extends StatefulWidget {
  const MirroringPage({super.key});

  @override
  State<MirroringPage> createState() => _MirroringPageState();
}

class _MirroringPageState extends State<MirroringPage> {
  var content = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('2번 문제'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          TextField(
              controller: content,
              onChanged: (value){
                setState(() {});
              },
          ),
          Text(content.text)
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){content.text='';setState(() {});},
        child: Icon(Icons.close),
      ),

    );
  }
}