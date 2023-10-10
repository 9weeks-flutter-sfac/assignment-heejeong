// 과제 1. **다음의 URL에 네트워크 요청을 보내고, 얻은 데이터를 Class를 통해 생성할 수 있도록 만드시오.**
// https://sniperfactory.com/sfac/http_json_data
// - 이 때 제작하는 Class 명은 자유입니다.
// - 받아온 네트워크 데이터를 Class에 적용시키고 플러터를 사용하여 다음의 화면을 제작합니다.

import 'package:assignment/model/post.dart';
import 'package:assignment/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var url = 'https://sniperfactory.com/sfac/http_json_data';
    var dio = Dio();

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 3), () => dio.get(url)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Post post = Post(
                    title: snapshot.data!.data['item']['name'],
                    description: snapshot.data!.data['item']['description'],
                    imgUrl: snapshot.data!.data['item']['image'],
                    price: snapshot.data!.data['item']['price']);

                return Center(child: PostCard(post: post));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('인터넷 확인 중 입니다'),
                  CircularProgressIndicator(),
                ],
              ));
            }),
      ),
    );
  }
}
