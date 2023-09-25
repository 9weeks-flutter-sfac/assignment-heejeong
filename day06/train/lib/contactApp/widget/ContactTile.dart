// ignore_for_file: public_member_api_docs, sort_constructors_first
//기본 폼 자동 생성
//stless -> flutter stateless widget 클릭
import 'package:flutter/material.dart';
import 'package:train/contactApp/page/contact_detail_page.dart';

//ContactTile: 앞으로 사용되는 Widget 이름
class ContactTile extends StatelessWidget {
  const ContactTile({Key? key, required this.name, required this.phone, required this.imgUrl,}) : super(key: key);
  final String name;
  final String phone;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    //커스텀 위젯
    //보여줄 요소만 작성
    return ListTile(
      onTap: (){
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) 
                      => ContactDetailPage(
                        name: name,
                        phoneNumber: phone,
                        imgUrl: imgUrl,
                      ))
                    );
      },
      title: Text(name),
      subtitle: Text(phone),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: Icon(Icons.call),
    );
  }
}
