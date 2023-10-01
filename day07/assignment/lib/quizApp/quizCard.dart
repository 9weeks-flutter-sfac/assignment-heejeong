import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz, required this.onCorrect, required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    // var pageController = PageController(viewportFraction: 0.8);

    return Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 230,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quiz["question"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        quiz["options"].map<Widget>((option) {
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 9),
                              child: ElevatedButton(
                                onPressed: () {
                                  //누른 버튼의 라벨을 이용해 index값을 변수에 저장
                                  var optionIndex = quiz["options"].indexOf(option);

                                  quiz["answer"] == optionIndex+1 ? 
                                    onCorrect() : onIncorrect();
                                  
                                  //controller를 매개변수로 가져오지 않았는데
                                  //어떻게 사용하지?
                                  // pageController.nextPage(
                                  //     duration:
                                  //         Duration(milliseconds: 500),
                                  //     curve: Curves.easeIn);

                                  //stateless이기 때문에 setstate사용못함
                                  //myAns 리스트가 실시간으로 반영안됌
                                  // setState(() {});
                                },
                                child: SizedBox(
                                  child: Center(
                                      child: Text(option.toString())),
                                ),
                              ));
                        }).toList(),
                  ),
                ],
              ),
            )
          ]
    );
  }
}