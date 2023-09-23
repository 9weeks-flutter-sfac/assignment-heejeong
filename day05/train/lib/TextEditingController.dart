import 'package:flutter/material.dart';

void main(){
  runApp((MyWidget()));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller:myController),
              TextButton(
                onPressed: (){
                  if(int.parse(myController.text) > 10){
                    print(myController.text);
                  }
                  else{
                    print('돈은 10원 이상부터 보낼 수 있습니다.');
                  }
                }, 
                child: Text('돈 보내기')
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