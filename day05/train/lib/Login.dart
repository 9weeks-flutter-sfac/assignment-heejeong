import 'package:flutter/material.dart';

void main(){
  runApp((MyWidget()));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController(text: '');
    var pwController = TextEditingController(text: '');


  //안좋은 코드 예시
    /* bool login(String id, String pw){
      if(pw.length >= 8){
        if(isEmail(id)){
          if(exists(id)){
            //패스워드 검사...서버와 통신해서 로그인
            return true;
          }
        }
      }
      return false;
    } */

    //좋은 코드 예시
    /* bood login(String id, String pw){
      if(pw.length < 8 ) return false;
      if(!isEmail(id)) return false;
      if(!exists(id)) return false;

      //패스워드 검사...서버와 통신해서 로그인
      return true;
    } */

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextField(controller:idController),
              TextField(
                controller:pwController,
                obscureText: true,  //글씨 안보이게 설정
                ),
              TextButton(
                onPressed: (){
                  print(idController.text);
                  print(pwController.text);
                }, 
                child: Text('login')
              ),
              // TextButton(
              //   onPressed: (){
              //     myController.text='';
              //   }, 
              //   child: Text('Erase'))
            ],
          ),
        ),
      ),
    );
  }
}