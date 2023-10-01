import 'package:assignment/packages/package_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // 데이터 모델 (예시)
  final imageUrl = [
  "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  var idx=0;

  void _onRefresh() async {
    // 새로고침 작업을 수행하는 비동기 코드를 여기에 추가
    await Future.delayed(Duration(seconds: 2));

    // 데이터가 업데이트되었다고 알림
    setState(() {
      idx+=1;
    });

    // 새로고침 완료
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onDoubleTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => packageCarouselSlider()));
            },
            child: Text('7일차 과제 1번'),
        )
      ),
      body: SmartRefresher(
        header: WaterDropHeader(),
        controller: _refreshController,
        enablePullDown: true, // 당겨서 새로 고침 활성화
        onRefresh: _onRefresh, // 새로 고침 작업을 수행하는 함수
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 원하는 모양으로 경계선 설정
            child: Container(
              child: Image.network(imageUrl[idx])),
          ),
        )
      )
    );
  }
}
