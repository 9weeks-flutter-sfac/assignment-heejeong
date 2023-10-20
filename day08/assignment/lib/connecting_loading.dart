import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

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
  late Future result; // 데이터 가져오기 결과
  List<dynamic>? dogList; //다시 시작할 때 가져오는 데이터 값이 null일 수 있음
  bool isCheckingNetwork = false; //네트워크 연결 확인 중
  bool isNetworkConnect = true; //네트워크 연결 확인
  var connectivityResult = ConnectivityResult.none; //네트워크 연결 상태
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //데이터 가져오기
  Future getData() async {
    try {
      var res = await dio.get(url); //데이터 요청
      await Future.delayed(
          Duration(milliseconds: 1500)); //shimmer 화면을 출력하기 위한 딜레이
      return res.data['body']; //결과 리턴
    } catch (e) {
      print(e);
    }
  }

  //연결상태 확인
  Future<void> checkInternetConnection() async {
    isCheckingNetwork = true; //네트워크 연결 확인 중
    setState(() {}); //네트워크 연결 확인 중 화면으로 그리기

    connectivityResult = await Connectivity().checkConnectivity();
    await Future.delayed(
        Duration(milliseconds: 1500)); // 연결 확인 중 화면을 출력하기 위한 딜레이

    //네트워크 연결된 경우
    if (connectivityResult != ConnectivityResult.none) {
      isNetworkConnect = true;
    } else {
      isNetworkConnect = false;
    }

    isCheckingNetwork = false; //네트워크 연결 확인 종료
    setState(() {}); //결과에 맞는 화면 그리기
  }

  void _onRefresh() async {
    // 새로고침 작업을 수행하는 비동기 코드를 여기에 추가
    result = getData(); //데이터 가져오기
    // await Future.delayed(Duration(seconds: 2));

    // 데이터가 업데이트되었다고 알림
    setState(() {});

    // 새로고침 완료
    _refreshController.refreshCompleted();
  }

// 앱이 처음 시작될 때 실행
  @override
  void initState() {
    super.initState();
    //자동으로 인터넷 연결 상태를 확인합니다.
    checkInternetConnection();
    result = getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('8일차 과제'),
          centerTitle: true,
        ),

        //네트워크 연결 확인 중이 아니면서, 네트워크가 연결된 경우
        body: !isCheckingNetwork && isNetworkConnect
            ? FutureBuilder(
                future: result,
                builder: (context, snapshot) {
                  print('현재 스냅샷 정보: ${snapshot.connectionState}');
                  print('hasData 값: ${snapshot.hasData}');
                  print('internet connectivityResult 값: ${connectivityResult}');

                  //snapshot.data 값이 null일 수도 있음
                  dogList = snapshot.data;

                  return SmartRefresher(
                      header: WaterDropHeader(),
                      controller: _refreshController,
                      enablePullDown: true, // 당겨서 새로 고침 활성화
                      onRefresh: _onRefresh, // 새로 고침 작업을 수행하는 함수
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 1 / 1.2, //item 의 가로 1, 세로 1 의 비율
                            mainAxisSpacing: 10, //수평 Padding
                            crossAxisSpacing: 10, //수직 Padding
                          ),
                          itemCount: dogList?.length ?? 6,
                          itemBuilder: (context, index) {
                            var msg = dogList?[index]['msg'] ?? '';
                            var imgUrl = dogList?[index]['url'] ?? '';

                            // 데이터 불러오기 완료
                            return snapshot.connectionState ==
                                    ConnectionState.done
                                ? Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      //색 설정안하면 boxshadow 색으로 덮어짐
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), // 그림자 색상과 투명도 설정
                                          spreadRadius: 2, // 그림자 확산 반경 설정
                                          blurRadius: 5, // 그림자 흐림 반경 설정
                                          offset:
                                              Offset(0, 3), // 그림자 위치 (가로, 세로)
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(imgUrl),
                                                  fit: BoxFit.cover)),
                                        )),
                                        msg != null
                                            ? Text(msg)
                                            : Text('주제를 정해주세요'),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(children: [Icon(Icons.comment)])
                                      ],
                                    ))
                                //로딩 중(데이터를 가져오는 중)
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ));
                          }));
                },
              )
            //네트워크 연결안된 경우
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: isNetworkConnect
                    ? [
                        Text('인터넷 확인 중 입니다'),
                        CircularProgressIndicator(),
                      ]
                    : [Text('인터넷이 연결되지 않았습니다.')],
              )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await checkInternetConnection();
          },
          child: Icon(Icons.wifi_find_sharp),
        ),
      ),
    );
  }
}
