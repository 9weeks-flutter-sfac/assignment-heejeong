import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var myFriends = ['Teddy', 'Chris','Juno'];
    // var iterableMyFriends = myFriends.map();
    // iterableMyFriends.toList();

    var categories = ['식품', '생활', '디지털', '뷰티'];
    var mathScore = [96, 92, 73, 98, 70, 82, 48, 97];

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          //map
          /* child: Row(
            children: categories.map((e){
                return Text(e);
              }).toList()
          ) */

          //chip
          /* child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((e){
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Chip(label: Text(e),),
                );
              }).toList()
          ) */
          
          //map & ListTile
          /* child: Column(
            children: myFriends.map((e){
                return ListTile(
                  title: Text(e),
                  subtitle: Text('동네친구 $e'),
                  trailing: Icon(Icons.call),
                );
              }).toList() */


          //map & Container
          /* child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10개월간의 수학 점수'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mathScore.map((e){
                        return Container(
                          width: e*2,
                          height: 24,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.greenAccent,
                                Colors.white
                              ]
                            )
                          ),
                        );
                      }).toList()
                  )
              ]
            )
          ) */

          //where
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10개월간의 수학 점수'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: mathScore.where((e){
                      return e <= 80;
                    }).map((e){
                        return Container(
                          width: e*2,
                          height: 24,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.greenAccent,
                                Colors.white
                              ]
                            )
                          ),
                        );
                      }).toList()
                  )
              ]
            )
          )
        ),
      ),
    );
  }
}