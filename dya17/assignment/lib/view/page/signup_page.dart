import 'package:assignment/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const String route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
            ),
            TextField(
              controller: controller.pwController,
            ),
            TextField(
              controller: controller.pwConController,
            ),
            TextField(
              controller: controller.usernameController,
            ),
            ElevatedButton(onPressed: controller.signup, child: Text('signup')),
          ],
        ),
      ),
    );
  }
}
