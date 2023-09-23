import 'package:flutter/material.dart';
import 'package:train/ArticleTile.dart';

void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Example3(),
    );
  }
}

class Example extends StatelessWidget{
  const Example({super.key});

  @override
  Widget build(BuildContext context){
    bool isLogined = true;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Text('스팩커뮤니티'),
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Text(
              '스팩컴퍼니의 가족! 안녕하세요',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox( height: 16,),
            

            //if문 안에는 하나의 위젯만 넣을 수 있음
            //중괄호 안씀
            if(isLogined)
              Column(
                children: [
                  ArticleTile(
                    title: '피파 1등 누군지 알아냈습니다',
                    author: '익명',
                    content: '바로 저입니다. 제가 제일 잘합니다',
                  ),
                  ArticleTile(
                    title: '스팩사무실 풀스 피파 1위가 정해졌습니다',
                    author: '익명',
                    content: '내용은 똑같습니다'
                  ),
                  ArticleTile(
                    title: '탕비실에서 사탕 숨겨놨는데 위치알려드릴까요',
                    author: '익명',
                    content: '내용은 똑같습니다'
                  ),
                  ArticleTile(
                    title: '자꾸 폐지 김스팩님 자리 옆에 놓지 마세요',
                    author: '익명',
                    content: '내용은 똑같습니다'
                  ),
                  ArticleTile(
                    title: '저랑 같이 점심먹을 분 있나요?',
                    author: '주노',
                    content: '내용은 똑같습니다'
                  ),
                  ArticleTile(
                    title: '웃긴짤 공유합니다',
                    author: '저스틴',
                    content: '내용은 똑같습니다'
                  )
                ]
              )
            else
              Text('안녕하세요')
          ]
        ),
      ),
    ),

    );
  }
}

class Example2 extends StatelessWidget{
  const Example2({super.key});

  @override
  Widget build(BuildContext context){
    bool isLogined = false;
    String userType = '관리자';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              ListTile(
                title: Text('언어설정(Korean)'),
                leading: Icon(Icons.language),
              ),
              ListTile(
                title: Text('회원정보'),
                leading: Icon(Icons.verified_user),
              ),
              ListTile(
                title: Text('버전정보'),
                leading: Icon(Icons.vertical_split_outlined),
              ),
              ListTile(
                title: Text('마음의 편지'),
                leading: Icon(Icons.question_answer),
              ),
              ListTile(
                title: Text('오픈라이센스'),
                leading: Icon(Icons.document_scanner),
              ),
              userType == '관리자' ? 
                Text("관리자는 사직서 제출 못해") 
                : ListTile(
                  title: Text('사직서제출 (회원탈퇴)'),
                  leading: Icon(Icons.block),
                ),
              isLogined ? 
                ListTile(
                  title: Text('로그아웃'),
                  leading: Icon(Icons.logout))
                : Text('로그인해주세요'),
            ]
          )
        )
      )
    );
  }
}

class Example3 extends StatefulWidget{
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}


class _Example3State extends State<Example3>{
  var isChecked = false;
  var isLogined = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          // child: Checkbox(
          //   value: isChecked,
          //   onChanged: (value){
          //     isChecked = value!;
          //     setState(() {});
          //   },
          // )

          child: Column(
            children: [
              Text("안녕하세요"),
              Visibility(
                visible: isLogined,
                child: Text("당신은 회원입니다"),
              ),
              Text("반가워요")
            ],
          )
        ),
      ),
    );
  }
}