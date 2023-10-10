import 'package:flutter/material.dart';
void main(){
  runApp(MyWidget());
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 110,
              left: 140,
              child: Text('10월 6일 금요일', style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),)),
            Positioned(
              top: 120,
              left: 110,
              child: Text('14:58', style: TextStyle(fontSize: 80, color: Colors.green, fontWeight: FontWeight.bold),),),
            Positioned(
              top: 190,
              child: CircleAvatar(
              radius: 140,
              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/1823/1823324.png'),
              backgroundColor: Colors.amber,
            )),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.grey,
            child: Icon(Icons.flashlight_on),
            ),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.grey,
            child: Icon(Icons.camera_alt_rounded),
            ),
        ],
      ),
      ),
    );
  }
}