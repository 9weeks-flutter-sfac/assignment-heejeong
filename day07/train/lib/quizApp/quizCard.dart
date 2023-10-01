import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz, required this.onCorrect, required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    // var pageController = PageController(viewportFraction: 0.8);

    return Container(
      margin: EdgeInsets.all(32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      
      child: Column(
            children: [
              Text(quiz["question"], 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 16,),
              ListView.builder(
                //pageview안에 listview가 있어
                //listview가 가지고 있어야하는 사이즈 파악 못함
                shrinkWrap: true,
                
                itemCount: quiz["options"].length,
                itemBuilder: (context, optionindex) => ElevatedButton(
                  onPressed: (){
                    quiz["answer"] == optionindex+1 ? onCorrect() : onIncorrect();
                  }, 
                  child: Text(quiz["options"][optionindex].toString()))
              )
            ],
          ),
                
              
    );
  }
}