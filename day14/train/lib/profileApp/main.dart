// - **반드시 Profile 클래스를 만들고 Serialization을 진행할 수 있도록 하시오.**
// - **각 사람별 이미지를 CircleAvatar를 통해 보여주도록 한다.**
//     - 이 때, 해당 API에는 프로필이미지가 없으므로 다음의 이미지 URL을 활용한다.
//         - [https://xsgames.co/randomusers/assets/avatars/male/{번호}.jpg](https://xsgames.co/randomusers/assets/avatars/male/$%7Bprofile.id%7D.jpg)
//         - 위 URL에 들어가는 {번호}에는 유저ID를 넣어 사용할 수 있도록 한다.
// - **애니메이션 효과를 적절히 사용하여 최대한 위 결과물과 비슷하도록 만드시오.**
// - **네트워크에 통신하여 데이터를 가져오는 것은 첫 페이지(리스트 보여주는 페이지)에만 할 수 있도록 한다.**

import 'package:flutter/material.dart';
import 'package:train/profileApp/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
