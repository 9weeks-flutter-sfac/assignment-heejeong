import 'package:assignment/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: controller.back,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: controller.idController,
                decoration: InputDecoration(
                  label: Text("username 입력"),
                  labelStyle: TextStyle(color: Colors.green),
                )),
            TextField(
              controller: controller.pwController,
              decoration: InputDecoration(
                label: Text("PW 입력"),
                labelStyle: TextStyle(color: Colors.green),
              ),
            ),
            ElevatedButton(onPressed: controller.login, child: Text('Login')),
            ElevatedButton(onPressed: controller.signup, child: Text('Signup')),
          ],
        ),
      ),
    );
  }
}
