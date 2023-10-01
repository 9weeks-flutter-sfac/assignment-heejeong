import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  var url = 'https://sniperfactory.com/sfac/http_json_data';
  var dio = Dio();

  void getDataUsingHttp() async {
    var res = await http.get(Uri.parse(url));
    //데이터타입이 String
    print(res.body.runtimeType);
  }

  void getDataUsingDio() async {
    var res = await dio.get(url);
    //res: 모든 문자들이 따음표안에 있음
    //res.data: 모든 문자들에 따음표가 없음
    //데이터 타입이 Map()
    print(res.data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: (){
                  getDataUsingDio();
                }, 
                child: Text('getDataUsingDio'),
              ),
              TextButton(
                onPressed: (){
                  getDataUsingHttp();
                }, 
                child: Text('getDataUsingHttp'),
              )
            ]
            ),
        ),
      ),
    );
  }
}