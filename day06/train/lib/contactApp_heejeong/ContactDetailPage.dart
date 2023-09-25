// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:train/contactApp_heejeong/ContactTile.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key? key, required this.name, required this.phoneNumber, required this.imgUrl,}) : super(key: key);
  final String name;
  final String phoneNumber;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            toolbarHeight: 150, // 헤더 높이 설정
            title: Text('연락처 상세'),
            //헤더에 자식 위젯 추가
            //이미지 배경 넣음
            flexibleSpace: Image(
              image: NetworkImage(imgUrl), // 이미지 경로 설정
              fit: BoxFit.cover, // 이미지가 화면을 가득 채우도록 설정
            ),
          ),

      body: ContactTile(
        name: name,
        phone: phoneNumber,
        imgUrl: imgUrl,
      ),
    );
  }
}
