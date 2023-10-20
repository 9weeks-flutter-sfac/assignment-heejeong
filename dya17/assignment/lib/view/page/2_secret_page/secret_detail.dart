// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:assignment/view/page/3_secret_upload/secret_upload.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class SecretDetail extends StatefulWidget {
  const SecretDetail({
    Key? key,
    required this.secretTitle,
    required this.backgroundImageUrl,
  }) : super(key: key);
  final String secretTitle;
  final String backgroundImageUrl;

  @override
  State<SecretDetail> createState() => _SecretDetailState();
}

// secretTitle 및 backgroundImageUrl 변수는
// SecretDetail 위젯의 필드로 선언되어 있으므로
// build 메서드 내에서 직접 사용할 때
// widget.secretTitle 및 widget.backgroundImageUrl 형태로 접근해야 합니다.
class _SecretDetailState extends State<SecretDetail> {
  List<String> avatarList = [
    'https://cdn-icons-png.flaticon.com/256/4860/4860828.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860766.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860774.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860869.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860895.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860797.png'
  ];
  final random = Random();

  //비밀 업로드
  void _openSecretUpload() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SecretUpload()));

    // 이전 화면으로부터 데이터를 받아와서 업로드 내용 갱신
    if (result != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.secretTitle,
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.amber,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.backgroundImageUrl),
                opacity: 0.3,
                fit: BoxFit.cover)),
        child: SafeArea(
            child: FutureBuilder(
                future: SecretCatApi.fetchSecrets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    //역순
                    // var reversedList = snapshot.data!.reversed.toList();
                    List<Secret>? secretList = snapshot.data;

                    return ListView.builder(
                      itemCount: secretList!.length,
                      itemBuilder: (context, index) {
                        avatarList.shuffle(random);
                        var secret = secretList[index].secret;
                        var author = secretList[index].author;

                        return ListTile(
                          leading: author?.avatar != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(author!.avatar!),
                                )
                              : CircleAvatar(
                                  child: Image.network(
                                    avatarList[0],
                                  ),
                                ),
                          title: Text(secret),
                          subtitle: author?.username != null
                              ? Text(author!.username)
                              : Text('익명'),
                        );
                      },
                    );
                  }
                  return LinearProgressIndicator();
                })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSecretUpload,
        child: Icon(Icons.add),
      ),
    );
  }
}
