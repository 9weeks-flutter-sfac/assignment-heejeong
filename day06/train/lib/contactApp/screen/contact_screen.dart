import 'dart:math';

import 'package:flutter/material.dart';
import 'package:train/contactApp/widget/ContactTile.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> contact = {
      '이테디' : '010-1111-2222',
      '밀리' : '010-3333-2222',
      '크리스' : '010-5555-4444',
      '주노' : '010-6666-2222',
      '혜리' : '010-1111-7777',
    };
    
    return ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context, index) {
            String name = contact.keys.elementAt(index);
            String phoneNumber = contact[name]!;
            // 랜덤 숫자 생성을 위한 Random 객체 생성
            Random random = Random();
            // 0 이상 99 이하의 난수 생성
            int randomNumber = random.nextInt(100);
            String imgUrl = 'https://picsum.photos/$randomNumber/$randomNumber';

            //커스텀 위젯 사용
            return ContactTile(
              name: name,
              phone: phoneNumber,
              imgUrl: imgUrl,
            );
          },
        );
  }
}