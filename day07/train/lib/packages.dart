import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart' as badges;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: FadeInLeft( child: Text('단어 보여주기')),
        // ),
        body: PageView.builder(
          itemCount: nouns.length,
          itemBuilder: (context, index) => ZoomIn(
            duration: Duration(milliseconds: 1500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                badges.Badge(
                  badgeContent: Text('3'),
                  child: Text(nouns[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
                ),
                IconButton(
                  //알림창이 나와야하지만
                  //android에서는 안나옴
                  onPressed: (){Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );}, 
                  icon: FaIcon(FontAwesomeIcons.addressBook)
                  )
                ],
              ))

          ),

      ),
    );
  }
}