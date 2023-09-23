import 'package:flutter/material.dart';

class BaseBottom extends StatelessWidget {
  const BaseBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            iconSize: 17,
            backgroundColor: Colors.black,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.grey,
            unselectedItemColor: Colors.grey,

            //item의 라벨을 없애기 위해서는 무조건 속성으로 설정해야함
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios_new_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.crop_square_outlined), label: ''),
            ],
          );
  }
}

class KeypadBottom extends StatelessWidget {
  const KeypadBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            iconSize: 17,
            backgroundColor: Colors.black54,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.grey,
            unselectedItemColor: Colors.grey,

            //item의 라벨을 없애기 위해서는 무조건 속성으로 설정해야함
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.keyboard_double_arrow_down_sharp), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.crop_square_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.keyboard_alt_outlined), label: ''),
            ],
          );
  }
}