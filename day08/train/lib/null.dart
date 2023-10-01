import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Dio dio = Dio();
  String? message = "메세지 가져오기";
  String? result = null;

  void getData() async{
    var res = await dio.get('https://sniperfactory.com/sfac/http_randomly_null');
    var item = res.data['item'];
    result = item['name'] ?? '데이터를 불러올 수 없습니다.';
    print(item['name']);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              if(result != null)
                Text(result!),
              TextButton(
                onPressed: (){
                  getData();
                }, 
                child: Text(message!),
              ),
            ]
            ),
        ),
      ),
    );
  }
}