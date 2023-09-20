// ### **Requirements**
// 1. 음료 이미지는 CircleAvatar를 사용하며 48의 반지름크기를 갖는다.
// 2. 음료 영문명의 font size는 14pt이며 회색으로 w200의 굵기를 가진다.
// 3. 음료의 정보를 보여주는 위젯을 만들고, 이름은 DrinkTile로 한다.

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({Key? key, required this.menuNameKo, required this.menuNameENG, required this.menuPrice, required this.imgUrl,}) : super(key: key);
  final String menuNameKo;
  final String menuNameENG;
  // final String menuPrice;
  final int menuPrice;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    //내가 한 것
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: CircleAvatar(
    //         radius: 48,
    //         backgroundImage: AssetImage(imgUrl),
    //       )
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(menuNameKo, style: TextStyle(fontSize: 14)),
    //         Text(menuNameENG, style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w200)),
    //         Text(menuPrice, style: TextStyle(fontSize: 14))
    //       ],
    //     )
    //   ],
    // );

    //강사님
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius:48,
            backgroundImage: AssetImage(imgUrl),
          ),
          SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(menuNameKo, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(menuNameENG, style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w200)),
              SizedBox(height:8),
              Text('$menuPrice원', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              // Text(menuPrice.toString() + '원', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
            ],
          )
        ],
      )
    );

  }
}
