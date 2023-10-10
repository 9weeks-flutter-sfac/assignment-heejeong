// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:assignment/model/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // 여기서 곡선을 조절합니다.
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //이미지때문에 card위젯의 상단 테두리에 곡선이 적용되지 않아
                //이미지의 상단 테두리에 곡선을 적용
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0), // 좌상단만 곡선
                    topRight: Radius.circular(16.0), // 우상단만 곡선
                  ),
                  child: Image.network(
                    post.imgUrl,
                    fit: BoxFit.cover,
                    // card의 높이에 맞춰 커버가 되어
                    // 이미지 너비를 따로 설정
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(post.description),
                      SizedBox(
                        height: 14,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50)),
                          onPressed: () {},
                          child: Text('${post.price}원 결제하고 등록'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
        ));
  }
}
