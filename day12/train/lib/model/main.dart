import 'package:flutter/material.dart';
import 'package:train/model/post.dart';
import 'package:train/widget/post_card.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Post post = Post(
      symbolImg: '',
      title: 'A simple Pomodoro App written in Flutter',
      postUrl: '',
      createdAt: DateTime(2021, 2, 25),
      readTime: null,
      thumbnailImg: '',
      comments: []);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: PostCard(post: post),
        ),
      ),
    );
  }
}
