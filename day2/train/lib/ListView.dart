// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          // scrollDirection: Axis.horizontal,  //가로로 설정
          children: [
          ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

          ListTile(
            title: Text("김스틴"), 
            subtitle: Text("010-9000-8000"), 
            trailing: Icon(Icons.call),
            leading: ClipOval(  
              child: Image.network('https://picsum.photos/100/100')
              ),
            ),

          ListTile(
            title: Text("이주노"), 
            subtitle: Text("010-3000-3000"), 
            trailing: Icon(Icons.call),
            leading: ClipRRect( //원의 사이즈로 사진이 잘림(사진 크기 그대로)
              borderRadius: BorderRadius.circular(99),
              child: Image.network('https://picsum.photos/100/100'),
              ),
            ),

          ListTile(
            title: Text("임헬렌"), 
            subtitle: Text("010-2000-8000"), 
            trailing: Icon(Icons.call),
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
              ),
              clipBehavior: Clip.antiAlias, //자식에 있는 이미지를 부모의 데코레이션 속성에 맞춤
              child: Image.network('https://picsum.photos/100/100'),
            ),
            ),

          ListTile(
            title: Text("염해리"), 
            subtitle: Text("010-1000-1000"), 
            trailing: Icon(Icons.call),
            leading: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(99),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias, //자식에 있는 이미지를 부모의 데코레이션 속성에 맞춤
              child: Image.network('https://picsum.photos/100/100'),
            ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),

            ListTile(
            title: Text("이테디"), 
            subtitle: Text("010-1000-2000"), 
            trailing: Icon(Icons.call),
            leading: CircleAvatar(
              // radius: 36, //원의 크기
              // backgroundColor: Colors.red,
              // child: Image.network('https://picsum.photos/100/100'), //cirvatar 위제 위에 이미지 적용
              backgroundImage: NetworkImage('https://picsum.photos/100/100'), //provider 형태로 제공해야함으로 NetworkImage() 사용
              ),
            ),
        ],)
      )
    );
  }
}

