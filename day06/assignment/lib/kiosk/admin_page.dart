import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text('메뉴 추가하기'),
          ),
          ListTile(
            title: Text('키오스크 화면 잠그기'),
          ),
          ListTile(
            title: Text('매장 등록 정보'),
          ),
        ],
      ),
    );
  }
}