import 'dart:math';

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var names = ['이테디', '밀리','크리스', '주노', '혜리'];
    var icons = [Icons.call_made, Icons.call_missed, Icons.call_received];

    return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            // 랜덤 숫자 생성을 위한 Random 객체 생성
            Random random = Random();
            // 0 이상 99 이하의 난수 생성
            int randomName = random.nextInt(names.length);
            int randomIcon = random.nextInt(icons.length);

            return ListTile(
              title: Text(names[randomName]),
              trailing: Icon(icons[randomIcon]),
            );
          }
          );
  }
}