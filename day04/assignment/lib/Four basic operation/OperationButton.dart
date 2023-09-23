// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({Key? key, required this.text,}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 150,
                  height: 35,
                  child: Text("$text의 결과값은?!", style: TextStyle(color: Colors.white),),
                  alignment: Alignment.center,
                  //color 속성을 사용할 때, 데코레이션 속성 사용 시
                  //데코레이션 속성안에 color 속성을 사용해야함
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // 모서리를 둥글게 만듦
                    color: Colors.blue
                  ),
                );
  }
}
