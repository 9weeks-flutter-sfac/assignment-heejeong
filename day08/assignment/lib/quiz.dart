import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var dio = Dio();
  var result='시작';

  void getDataUsingDio() async {
    var res;
    for(var i=100;i<=150;i++){
      try {
        print(i);
        res = await dio.get('https://sniperfactory.com/sfac/http_assignment_${i}',
          options: Options(
          headers: {
          "user-agenct" : "SniperFactoryBrowser",
          "authorization" : "Bearer ey-12312312312312"}
        ));
        if(res != null) print(i);break;
      }catch(e){
        result = '${e}';
      }
      setState(() {});
    }

    if (res != null) {
      result = res.data;
      print(res.data);
      setState(() {});
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(result),
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