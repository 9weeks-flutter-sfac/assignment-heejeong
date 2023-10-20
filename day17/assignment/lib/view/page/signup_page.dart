import 'package:assignment/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const String route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: controller.back,
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                label: Text("email 입력"),
                labelStyle: TextStyle(color: Colors.green),
                hintText: '이메일형식) abvd12@gmail.com',
              ),
            ),
            TextField(
              controller: controller.pwController,
              decoration: InputDecoration(
                label: Text("PW 입력"),
                labelStyle: TextStyle(color: Colors.green),
                hintText: '9자리 이상',
              ),
            ),
            TextField(
              controller: controller.pwConController,
              decoration: InputDecoration(
                label: Text("PW 입력 확인"),
                labelStyle: TextStyle(color: Colors.green),
                hintText: 'PW 확인',
              ),
            ),
            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                label: Text("username 입력"),
                labelStyle: TextStyle(color: Colors.green),
                hintText: 'username 입력',
              ),
            ),
            ElevatedButton(onPressed: controller.signup, child: Text('signup')),
          ],
        ),
      ),
    );
  }
}
