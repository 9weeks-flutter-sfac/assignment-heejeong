import 'package:flutter/material.dart';

void main(){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    List<Map<String, String>> vocaList = [
      {
        "voca" : "apple",
        "mean" : "사과",
        "example" : "I want to eat an apple"
      },
      {
        "voca" : "resillient",
        "mean" : "탄력있는, 회복력있는",
        "example" : "She is a resillient girl"
      },
      {
        "voca" : "revoke",
        "mean" : "취소하다",
        "example" : "She threatened to revoke his privileges if he didn't follow the rules"
        // "example" : "The company decided to revoke the new policy after it received negative feedback from customers"
      },
      {
        "voca" : "withdraw",
        "mean" : "철회하다",
        "example" : "The soldiers were ordered to withdraw from the battlefield"
      },
      {
        "voca" : "paper",
        "mean" : "종이",
        "example" : "The office was cluttered with stacks of paper documents"
      },
    ];
    
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            itemCount: vocaList.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  vocaList[index]['voca'].toString(),
                  style: TextStyle(
                    //글자 간격 설정
                    //음수: 좁히기 / 양수: 넓히기
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold, 
                    fontSize: 24), 
                ),

                const SizedBox(height: 8,),

                Text(
                  vocaList[index]['mean']!,
                  style: TextStyle(
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold, 
                    fontSize: 14, 
                    color: Colors.grey), 
                ),
                Text(
                  '"${vocaList[index]['example']!}"',
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 1),
                )
              ]
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              child: Icon(Icons.navigate_before),
              onPressed: (){
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: (){
                pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            )
          ]
        )),
      ),
    );
  }
}