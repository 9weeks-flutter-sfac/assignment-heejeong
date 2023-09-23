// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({
    Key? key,
    required this.title,
    required this.author,
    required this.content,
  }) : super(key: key);
  final String title;
  final String author;
  final String content;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  bool isExpended = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          //stateful widget일 때, 변수명 앞에 'widget.'을 붙여줘야함
          title: Text(widget.title),
          subtitle: Text(widget.author),
          onTap: (){
            isExpended = !isExpended;
            setState(() {});
          },
        ),
        if(isExpended)
          Text(widget.content)
      ]
    );
  }
}