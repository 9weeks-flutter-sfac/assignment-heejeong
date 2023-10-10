import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train/kiosk/OptionCard.dart';
import 'package:train/kiosk/admin_page.dart';
import 'package:dio/dio.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  Dio dio = Dio();
  List<String> myMenu = [];
  List<int> myMenuPrice = [];
  SharedPreferences? prefs;

  Future<List<dynamic>> getData() async {
    var res = await dio
        .get('http://52.79.115.43:8090/api/collections/options/records');
    //연결 성공
    if (res.statusCode == 200) {
      // print(res.data['items'].runtimeType);
      return res.data['items'];
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var myList = prefs!.getStringList('myMenuList');
      myMenu = myList ?? [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
            //두번 클릭할 때, 이벤트 발생
            onDoubleTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            },
            child: Text('분식왕 이테디 주문하기')),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),

      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "주문 리스트",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),

                  //Column안에 바로 ListView를 쓰면 사이즈에러 발생
                  //높이 지정해줘야함
                  Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: myMenu.isEmpty
                          ? Text('주문한 내역이 없습니다.')
                          : Wrap(
                              children: myMenu
                                  .map((e) => Chip(
                                        onDeleted: () {
                                          myMenu.remove(e);
                                          setState(() {});
                                        },
                                        label: Text(e),
                                      ))
                                  .toList(),
                            )),

                  SizedBox(height: 22),
                  Text(
                    "음식",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),

                  //column/row 위젯은 main방향으로 계속 확장하려는 성질이 있음
                  //GridView는 ListView와 비슷하게 스크롤이 있음
                  //따라서 SizedBox/Container 위젯으로 main 사이즈 설정해줘야함
                  //Container(
                  // height: 300,

                  //무조건 column/row 위젯 안에서 사용
                  //expanded 위젯의 자식은 column/row가 가질 수 있는
                  //모든 영역을 사용
                  Expanded(
                      child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print('done');
                        print(snapshot.data);
                        return GridView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  //한 행에 3개를 넣는다는 뜻
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4),
                          itemBuilder: (context, index) {
                            return OptionCard(
                                foodName: snapshot.data![index]['menu'],
                                ImgUrl: snapshot.data![index]['imageUrl'],
                                onTap: () {
                                  // print(snapshot.data![index]['menu']);
                                  if (prefs != null) {
                                    prefs!.setStringList('myMenuList', myMenu);
                                  }
                                  myMenu.add(snapshot.data![index]['menu']);
                                  setState(() {});
                                });
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ))
                ],
              ))),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: myMenu.isNotEmpty
          ? FloatingActionButton.extended(
              //label 속성 추가하기 위해 '.extended' 사용
              onPressed: () {},
              label: Text('결제하기'),
            )
          : null,
      //null을 넣으면 서서히 사라짐(애니메이션 효과 있음)
      //const SizedBox()를 넣으면 힌번에 딱 사라짐(애니메이션 효과 없음)
    );
  }
}
