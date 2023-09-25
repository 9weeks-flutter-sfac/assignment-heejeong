
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectIndex = 2;

    return ListView(
          children: [
            ListTile(
              title: Text('차단목록'),
            ),
            ListTile(
              title: Text('벨소리설정'),
            ),
            ListTile(
              title: Text('전화통계'),
            ),
          ]
        );
  }
}