import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var url = 'https://sniperfactory.com/sfac/http_day16_dogs';
  var dio = Dio();
  var datas;

  Future<dynamic> getDataUsingDio() async{
    var res = await dio.get(url);

    print(res.data);
    return res.data;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('8일차 과제'),
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: (){
                  FutureBuilder(
                    future: Future.delayed(Duration(seconds:3), ()=>datas = dio.get('https://sniperfactory.com/sfac/http_day16_dogs')),
                    builder: (context, snapshot){
                      print('현재 스냅샷 정보: ${snapshot.connectionState}');
                      print('hasData 값: ${snapshot.hasData}');
                      if(snapshot.connectionState == ConnectionState.done){	// 현재 futurebuilder의 상채가 끝났을 때
                        print("done");
                        return Text(snapshot.data?.data.toString() ?? "실패");
                        // return Text(snapshot.data!.data['result']);
                      }

                      return Column(
                        children: [
                          Text('인터넷 연결확인 중'),
                          CircularProgressIndicator(),
                        ]);	
                    }
                  );
                  // getDataUsingDio();
                  setState(() {});
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