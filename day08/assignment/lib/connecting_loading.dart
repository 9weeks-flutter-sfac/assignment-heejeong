import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var url = 'https://sniperfactory.com/sfac/http_day16_dogs';
  var dio = Dio();
  var datas;
  var connectivityResult = ConnectivityResult.none;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //연결상태 확인
  Future<void> checkInternetConnection() async {
    var connectivity = await Connectivity().checkConnectivity();
    setState(() {
      connectivityResult = connectivity;
    });
  }

  void _onRefresh() async {
    // 새로고침 작업을 수행하는 비동기 코드를 여기에 추가
    await Future.delayed(Duration(seconds: 2));

    // 데이터가 업데이트되었다고 알림
    setState(() {});

    // 새로고침 완료
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    // 앱이 초기화될 때 자동으로 인터넷 연결 상태를 확인합니다.
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('8일차 과제'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3),
              () => dio.get('https://sniperfactory.com/sfac/http_day16_dogs')),
          builder: (context, snapshot) {
            print('현재 스냅샷 정보: ${snapshot.connectionState}');
            print('hasData 값: ${snapshot.hasData}');
            print('internet connectivityResult 값: ${connectivityResult}');

            //인터넷 연결되었을 때
            if (connectivityResult != ConnectivityResult.none) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("done");
                print(snapshot.data!.data['body'].toString());
                List<dynamic> dogList = snapshot.data!.data['body'];
                // return Text(dogList[0]['url']);

                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1 / 1.2, //item 의 가로 1, 세로 1 의 비율
                      mainAxisSpacing: 10, //수평 Padding
                      crossAxisSpacing: 10, //수직 Padding
                    ),
                    itemCount: dogList.length,
                    itemBuilder: (context, index) {
                      var msg = dogList[index]['msg'];
                      var url = dogList[index]['url'];

                      return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            //색 설정안하면 boxshadow 색으로 덮어짐
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // 그림자 색상과 투명도 설정
                                spreadRadius: 2, // 그림자 확산 반경 설정
                                blurRadius: 5, // 그림자 흐림 반경 설정
                                offset: Offset(0, 3), // 그림자 위치 (가로, 세로)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(url),
                                        fit: BoxFit.cover)),
                              )),
                              msg != null ? Text(msg) : Text('주제를 정해주세요'),
                              SizedBox(
                                height: 7,
                              ),
                              Row(children: [Icon(Icons.comment)])
                            ],
                          ));
                    });
              }
            }

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('인터넷 확인 중 입니다'),
                CircularProgressIndicator(),
              ],
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await checkInternetConnection();
            //build를 다시 하면서 futurebuilder 다시 실행
            setState(() {});
          },
          child: Icon(Icons.wifi_find_sharp),
        ),
      ),
    );
  }
}
