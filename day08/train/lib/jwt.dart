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
  var url = 'https://sniperfactory.com/sfac/http_only_jwt_included';
  var dio = Dio();


  void getDataUsingDio() async {
    var res = await dio.get(url,
    options: Options(
      headers: {
      "user-agenct" : "Chrome",
      "authorization" : "Bearer ey-12312312312312"}
    ));
    print(res.data);
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
            ]
            ),
        ),
      ),
    );
  }
}