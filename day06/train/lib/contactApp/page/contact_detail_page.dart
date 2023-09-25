// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:train/contactApp/widget/ContactTile.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key? key, required this.name, required this.phoneNumber, required this.imgUrl,}) : super(key: key);
  final String name;
  final String phoneNumber;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body영역을 appbar영역까지 확장
      extendBodyBehindAppBar: true,

      appBar: AppBar(
            title: Text('연락처 상세'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

      body: Column(
        children: [
          Image.network(imgUrl, width: double.infinity, height: 150, fit: BoxFit.cover,),
          ContactTile(
          name: name,
          phone: phoneNumber,
          imgUrl: imgUrl,
          )
        ]
      ),
    );
  }
}
