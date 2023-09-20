// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:train/StarbucksTile.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          leading: Icon(Icons.navigate_before),
          actions: [
            //padding 해주어야 디자인이 예쁨
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search)
            )
          ],
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          
          child: ListView(
            children: [
              // child: Text("NEW", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
              Text("new".toUpperCase(), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              
              //상단의 글씨 new와 메뉴들 사이에 간격을 띄우기 위해
              SizedBox(height: 16,),

              DrinkTile(
                menuNameKo: "골든 미모사 그린 티", 
                menuNameENG: "Golden Mimosa Green Tea", 
                menuPrice: 6100, 
                imgUrl: "assets/images/starbucks/item_drink1.jpeg"
              ),
              DrinkTile(
                menuNameKo: "블랙 햅쌀 고봉 라떼", 
                menuNameENG: "Black Rice Latte", 
                menuPrice: 6300, 
                imgUrl: "assets/images/starbucks/item_drink2.jpeg"
              ),
              DrinkTile(
                menuNameKo: "아이스 블랙 햅쌀 고봉 라떼", 
                menuNameENG: "ICED Black Rice Latte", 
                menuPrice: 6300, 
                imgUrl: "assets/images/starbucks/item_drink3.jpeg"
              ),
              DrinkTile(
                menuNameKo: "스타벅스 튜메릭 라떼", 
                menuNameENG: "Starbucks Tumeric Latte", 
                menuPrice: 6100, 
                imgUrl: "assets/images/starbucks/item_drink4.jpeg"
              ),
              DrinkTile(
                menuNameKo: "아이스 스타벅스 튜메릭 라떼", 
                menuNameENG: "Iced Starbucks Tumeric Latte", 
                menuPrice: 6100, 
                imgUrl: "assets/images/starbucks/item_drink5.jpeg"
              ),
            ],
          )
        ),

        //바텀
        bottomNavigationBar: BottomNavigationBar(
          //item이 3개 이상일 때 자동으로 모양(설정)이 바뀜
          //모양(설정) 고정해주는 것이 필요
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green, //현재 인덱스 색
          currentIndex: 2,  //기본값 0으로 설정되어있음
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pay'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Order'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Other')
          ]
        ),

        //바텀바로 위에 보여줬다 사라졌다 하는 위젯
        bottomSheet: Container(
          height: 64,
          color: Colors.black87,
          child: Padding(
            //수직/수평 선택해서 패딩
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              //3.가로(main)를 기준으로 자식들의 간격 띄움
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  

              children: [
                //2. 자식 위젯의 공간이 꽉 참
                // Expanded(
                //   child: Text('주문할 매장을 선택해 주세요.', style: TextStyle(color: Colors.white),)
                // ),

                //1. spacer(), //가지고 있는 영역을 꽉 채움
                
                Text('주문할 매장을 선택해 주세요.', style: TextStyle(color: Colors.white),),
                Icon(Icons.expand_more, color: Colors.white,)
              ]),
            ),
        ),
      )
    );
  }
}