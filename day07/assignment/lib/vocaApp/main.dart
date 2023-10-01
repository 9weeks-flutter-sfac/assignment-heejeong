import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: Scaffold(
        body: PageView(
          children: []
          
          ),

          
        ),
    );
  }
}