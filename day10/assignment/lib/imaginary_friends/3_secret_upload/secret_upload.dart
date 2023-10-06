import 'package:assignment/imaginary_friends/2_secret_page/secret_detail.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class SecretUpload extends StatefulWidget {
  const SecretUpload({super.key});

  @override
  State<SecretUpload> createState() => _SecretUploadState();
}

class _SecretUploadState extends State<SecretUpload> {
  var textEditingController = TextEditingController();

  _onChangedSecret(String value) async{
    var secret = await SecretCatApi.addSecret(value);
    print(secret);
    // setState(() {});
  }
  
  // _onChangedAuthor(value) async{
  //   var author = await SecretCatApi.addSecret(value);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('쉿!비밀이야', style: TextStyle(color: Colors.pink[100]),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 248, 187, 208),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1690566250459-453c1d98846e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDI5MnxxUFlzRHp2Sk9ZY3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
            opacity: 0.3,
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              // onChanged: _onChangedSecret,
              decoration: InputDecoration(
                label: Text('비밀'),
                hintText: "공유하고 싶은 비밀을 작성해주세요.",
                border: OutlineInputBorder( // 테두리 스타일 설정
                  borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                  borderSide: BorderSide(color: Colors.blue), // 테두리 색상 설정
                ),
              ),
            ),
            SizedBox(height: 8,),

            /* TextField(
              onChanged: _onChangedAuthor,
              decoration: InputDecoration(
                label: Text('닉네임'),
                hintText: "닉네임",
                border: OutlineInputBorder( // 테두리 스타일 설정
                  borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                  borderSide: BorderSide(color: Colors.blue), // 테두리 색상 설정
                ),
              ),
            ), */

            ElevatedButton(
              onPressed: () {
                _onChangedSecret(textEditingController.text); // 버튼을 눌렀을 때 함수 실행
                Navigator.of(context).pop();
              },
              child: Text('공유하기')
            )
          ],
        ),
      ),
    );
  }
}