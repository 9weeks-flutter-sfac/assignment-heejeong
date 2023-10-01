// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

// import 'dart:math';

import 'package:train/youtube/YoutubemusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //var로 정의될 때는 변수의 뒤에는 Object가 들어감
    //따라서 dynamic으로 바꿔주는 것이 필요
    List<Map<String, dynamic>> playList = [
      {
        "title": "Come with me",
        "singer": "Surfaces 및 salem ilese",
        "time": Duration(minutes: 3, seconds: 0),
        "imgUrl": "assets/images/youtubemusic/music_come_with_me.png",
      }, 
      {
        "title": "Good day",
        "singer": "Surfaces",
        "time": Duration(minutes: 3, seconds: 0),
        "imgUrl": "assets/images/youtubemusic/music_good_day.png",
      },
      {
        "title": "Honesty",
        //변수를 가져와서 데이터를 쓸 때 '$' 사용
        //문자 '$' 를 사용하기 위해서 앞에 '\' 를 같이 작성
        "singer": "Pink Sweat\$", 
        "time": Duration(minutes: 3, seconds: 9),
        "imgUrl": "assets/images/youtubemusic/music_honesty.png",
      }, 
    ];

    return MaterialApp(
      //전체 화면 어둡게(2가지 방법)
      // 흰 바탕 + 검은색 글씨 / 검은 바탕 + 흰 글씨 자동 설정
      //appBar, body, bottom의 배경색 따로 설정안해주어도 됌
      // theme: ThemeData.dark(),
      // theme: ThemeData.from(
      //   colorScheme: ColorScheme.dark()
      // ),

      home: Scaffold(
        appBar: AppBar(
          //바닥에 선(border_bottom) 표시 
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          backgroundColor: Colors.black,
          
          
          title: Text('아워리스트'),
          leading: Icon(Icons.navigate_before),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Icon(Icons.airplay)
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Icon(Icons.search),
            )
          ]
        ),

        //theme 속성 사용하면 container 위젯 필요없이
        //바로 ListView 위젯 사용 가능
        /* body: Container(
          decoration: BoxDecoration(
                  color: Colors.black
                ),
          child: ListView(
            children: [
              MusicTile(
                title: "Come with me",
                singer: "Surfaces 및 salem ilese",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_come_with_me.png",
              ),
              MusicTile(
                title: "Good day",
                singer: "Surfaces",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_good_day.png",
              ),
              MusicTile(
                title: "Honesty",
                //변수를 가져와서 데이터를 쓸 때 '$' 사용
                //문자 '$' 를 사용하기 위해서 앞에 '\' 를 같이 작성
                singer: "Pink Sweat\$", 
                time: "3:09",
                imgUrl: "assets/images/youtubemusic/music_honesty.png",
              ),
              MusicTile(
                title: "I Wish I Missed My Ex",
                singer: "마할리아 버크마",
                time: "3:24",
                imgUrl: "assets/images/youtubemusic/music_i_wish_i_missed_my_ex.png",
              ),
              MusicTile(
                title: "Plastic Plants",
                singer: "마할리아 버크마",
                time: "3:20",
                imgUrl: "assets/images/youtubemusic/music_plastic_plants.png",
              ),
              MusicTile(
                title: "Sucker for you",
                singer: "맷 테리",
                time: "3:24",
                imgUrl: "assets/images/youtubemusic/music_sucker_for_you.png",
              ),
              MusicTile(
                title: "Summer is for falling in love",
                singer: "Sarah Kang & Eye Love Brandon",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_summer_is_for_falling_in_love.png",
              ),
              MusicTile(
                title: "These days(feat. Jess Glynne, Macklemore & Dan Caplen)",
                singer: "Rudimental",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_these_days.png",
              ),
              MusicTile(
                title: "You Make Me",
                singer: "DAY6",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_you_make_me.png",
              ),
              MusicTile(
                title: "Zombie Pop",
                singer: "DRP IAN",
                time: "3:00",
                imgUrl: "assets/images/youtubemusic/music_zombie_pop.png",
              ),
            ],
          ),
        ), */

        body: ListView.builder(
          itemCount: playList.length,
          itemBuilder: (context, index) => MusicTile(
            title: playList[index]["title"], 
            singer: playList[index]["singer"], 
            time: playList[index]["time"].toString(), 
            imgUrl: playList[index]["imgUrl"]
          )
        ),

        bottomNavigationBar: BottomNavigationBar(
          //theme속성 사용 안해서 배경색 설정
          backgroundColor: Colors.grey[850],
          elevation: 0,
          //item이 3개 초과일 때 'type'속성에 따라 동작이 다르기 때문에 고정이 안됌
          //모양(설정) 고정해주는 것이 필요
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white, //현재 인덱스 색
          currentIndex: 2,  //기본값 0으로 설정되어있음

          //선택하지 않은 items 색 설정
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: '둘러보기'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music), label: '보관함'),
          ],
        ),

        bottomSheet: Column(
          //column 위젯은 자신의 영역보다 더 확장하려는 경향이 있음
          mainAxisSize: MainAxisSize.min, //최소한의 공간을 사용하도록 설정
          children: [
            Container(
                // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 64,
                color: Colors.grey[850],  //theme속성 사용했다면 Colors.white12 로 수정
                
                //내가 한 것
                // child: Row(
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(right: 15),
                //       child: Image.asset("assets/images/youtubemusic/music_you_make_me.png", scale: 3,),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       clipBehavior: Clip.antiAlias
                //     ),
                //    
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("You Make Me", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
                //         Text("Day6", style: TextStyle(fontSize: 15, color: Colors.white),),
                //       ],
                //     ),
                //
                //     Spacer(),
                //     Icon(Icons.play_arrow, color: Colors.white,),
                //     SizedBox(width: 18,),
                //     Icon(Icons.skip_next, color: Colors.white,)
                //   ]
                // ),

                //강사님
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('assets/images/youtubemusic/music_you_make_me.png'),
                  ),
                  title: Text("You make Me"),
                  subtitle: Text('DAY6'),
                  trailing: Row(
                    //최소한의 영역만 사용하겠다는 것을 의미
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //ROW 위젯이 자신의 공간보다 더 확장하려는 경향이 있음
                      //에러남
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.play_arrow)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.skip_next)
                      ),
                    ],
                  ),
                ),
            ),

            //재생 시간 표시
            Container(
              //바텀이랑 시트 사이에 재생 시간을 나타낼 수 있도록 높이 1만큼만 띄움
              height: 1,
              //자식의 container 위젯이 기본적으로 가운데로 설정되어 있음
              //자식 위젯을 원하는 위치로 옮김
              alignment: Alignment.centerLeft, 
              child: Container(
                width: 70, //재생 시간 
                color: Colors.white,
              ),
            )
          ]
        ),
      )
    );
  }
}