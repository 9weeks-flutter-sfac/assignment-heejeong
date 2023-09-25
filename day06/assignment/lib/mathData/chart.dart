// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.mathData,
  }) : super(key: key);
  final List mathData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
            itemCount: mathData.length,
            itemBuilder: (context, index){
              //ListView.builder의 자식 위젯으로 Container로 높이, 너비를 조절해도
              //부모위젯 ListView.builder의 너비, 높이 적용됌
              //Row 위젯으로 너비 영역을 최소화 시킴
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      height: 24,
                      //width속성의 타입은 double
                      width: mathData[index].toDouble()*2,
                      child: Text(mathData[index].toString()),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // 그림자 색상 설정
                            spreadRadius: 2, // 그림자 퍼짐 정도 설정
                            blurRadius: 5, // 그림자의 흐림 정도 설정
                            offset: Offset(2, 2), // 그림자의 위치 설정 (가로, 세로)
                          ),
                        ], 
                      ),
                    )
                  ]
                );
            }
            
      )
        
    );
  }
}

