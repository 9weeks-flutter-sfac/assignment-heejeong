import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //getint에서 사용하기 위해서 int 사용
  int _counter = 0;
  //처음 변수 선언 시,null이기 때문에 데이터타입에 ? 사용
  SharedPreferences? prefs;

  //initState 함수에 await을 사용하면 안됌!!!
  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  void initPreferences() async {
    //디버깅할 때, prefs에 null로 안들어감
    prefs = await SharedPreferences.getInstance();
    //새로고침 했을 때, 저장된 값 불러오기
    if (prefs != null) {
      //_counter라는 키값을 가져옴
      //처음 시작하는 사람은 null이므로 0으로 시작
      _counter = prefs!.getInt('_counter') ?? 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Text(
          '$_counter',
          style: TextStyle(fontSize: 48),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => _counter += 1);
            if (prefs != null) {
              //_counter 키값에 _counter 변수값을 넣음
              prefs!.setInt('_counter', _counter);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
