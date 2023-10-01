import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var dio = Dio();
  var res;
  // final connectivityResult = await (Connectivity().checkConnectivity());

  Future<Widget> connectingEthernet() async{
    final connectivityResult = await (Connectivity().checkConnectivity());

  return FutureBuilder(
      future: Future.delayed(Duration(seconds:3), ()=>res = dio.get('https://sniperfactory.com/sfac/http_day16_dogs')),
      // future: dio.get('https://sniperfactory.com/sfac/http_test'),
      builder: (context, snapshot){
        print('현재 스냅샷 정보: ${snapshot.connectionState}');
        print('hasData 값: ${snapshot.hasData}');
        if(snapshot.connectionState == ConnectionState.done){	// 현재 futurebuilder의 상채가 끝났을 때
          return Text(snapshot.data?.data.toString() ?? "실패");
          // return Text(snapshot.data!.data['result']);
        }
        // if(snapshot.hasData){
        //   //data! => snapshot.data에 확실히 데이터가 있을 때 사용
        //   //data? => snapshot.data는 response 혹은 null 일 수 있음
        //   //data? => null 이라면, 뒷 문장(.data.toString()) 다 실행 안함
        //   return Text(snapshot.data?.data.toString() ?? "실패");
        // }

        return Column(
          children: [
            Text('인터넷 연결확인 중'),
            LinearProgressIndicator(),
          ]
        );
        // return Container( //빈 위젯을 보내줌
        //   width: 20,
        //   height: 20,
        //   color: Colors.red,
        // );	
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('sniper factory'),
              connectingEthernet()
              /* FutureBuilder(
                future: Future.delayed(Duration(seconds:3), ()=>res = dio.get('https://sniperfactory.com/sfac/http_day16_dogs')),
                // future: dio.get('https://sniperfactory.com/sfac/http_test'),
                builder: (context, snapshot){
                  print('현재 스냅샷 정보: ${snapshot.connectionState}');
                  print('hasData 값: ${snapshot.hasData}');
                  if(snapshot.connectionState == ConnectionState.done){	// 현재 futurebuilder의 상채가 끝났을 때
                    return Text(snapshot.data?.data.toString() ?? "실패");
                    // return Text(snapshot.data!.data['result']);
                  }
                  // if(snapshot.hasData){
                  //   //data! => snapshot.data에 확실히 데이터가 있을 때 사용
                  //   //data? => snapshot.data는 response 혹은 null 일 수 있음
                  //   //data? => null 이라면, 뒷 문장(.data.toString()) 다 실행 안함
                  //   return Text(snapshot.data?.data.toString() ?? "실패");
                  // }

                  return Column(
                    children: [
                      Text('인터넷 연결확인 중'),
                      LinearProgressIndicator(),
                    ]
                  );
                  // return Container( //빈 위젯을 보내줌
                  //   width: 20,
                  //   height: 20,
                  //   color: Colors.red,
                  // );	
                }
              ) */
            ]
            ),
        ),
      ),
    );
  }
}