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
  var message = '';

  Future<String> getData() async{
    var dio = Dio();
    var res = await dio.get('https://sniperfactory.com/sfac/http_test');
    return res.data["result"];
  }

  void handleOnPressed() async{
    message = await getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(message),
              TextButton(
                onPressed: (){
                  handleOnPressed();
                }, 
                child: Text('데이터가져오기'),
              ),
            ]
            ),
        ),
      ),
    );
  }
}