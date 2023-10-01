// ignore_for_file: public_member_api_docs, sort_constructors_first
// ### **Requirements**

// 1. 음악명은 최대 2줄까지만 가능하다.
// 2. 가수명과 플레이시간은 최대 1줄까지만 가능하며 필요한 경우 가수명을 줄인다.
// 3. 음악의 정보를 보여주는 위젯을 만들고, 이름은 MusicTile로 한다.

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({Key? key, required this.title, required this.singer, required this.time, required this.imgUrl,}) : super(key: key);
  final String title;
  final String singer;
  final String time;
  final String imgUrl;


  @override
  Widget build(BuildContext context) {
    //내가 한 것
    // return Container(
    //   padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: Row(
    //               children: [
    //                 Container(
    //                   margin: EdgeInsets.only(right: 15),
    //                   child: Image.asset(imgUrl, scale: 3,),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5),
    //                   ),
    //                   clipBehavior: Clip.antiAlias
    //                 ),
                    
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Icon(Icons.check_circle, color: Colors.white, size: 13,),
    //                         Text(singer, style: TextStyle(fontSize: 13, color: Colors.white),),
    //                         Text("·", style: TextStyle(fontSize: 13, color: Colors.white),),
    //                         Text(time, style: TextStyle(fontSize: 13, color: Colors.white),)
    //                       ],
    //                     )
    //                   ],
    //                 ),

    //                 Spacer(),
    //                 Icon(Icons.more_vert, color: Colors.white,)
    //               ]
    //             ),
    //           );

    //강사님
    //내가 theme 속성을 사용하지 않고 backgroundColor로 색을 주었기 때문에 Colors.white를 넣어줬음
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(imgUrl),
      ),
      title: Text(
        title, 
        maxLines: 2,  //화면에 비해 글이 많을 때 최대 2줄까지만 허용
        overflow: TextOverflow.ellipsis,  //나머지 글을 '...'으로 표현
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Row(
          children: [
            Icon(Icons.check_circle, size:18),
            SizedBox(width: 4),

            //ROW위젯의 자식들 중 가장 많은 영역을 가지기 위해
            //자식은 확장이 우선시됌
            Flexible(
              child: Text(
                singer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 4,),

            Text('·', style: TextStyle(color: Colors.white),),
            SizedBox(width: 4,),

            Text(time, style: TextStyle(color: Colors.white),),
          ]
      ),
      trailing: Icon(Icons.more_vert, color: Colors.white),
    );
  }
}
