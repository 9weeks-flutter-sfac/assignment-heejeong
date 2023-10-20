import 'package:test/1_home_page/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //플러터 빌드나 디버깅시에 우측 상단에 표시되는
      //배너 제거
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Neo',
      ),
      home: const HomeScreen(),
    ),
  );
}
