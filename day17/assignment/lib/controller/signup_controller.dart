import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();
  var pwConController = TextEditingController();
  var usernameController = TextEditingController();

  signup() {
    Get.find<AuthController>().signup(emailController.text, pwController.text,
        pwConController.text, usernameController.text);
  }

  logout() {
    emailController.text = '';
    pwController.text = '';
    pwConController.text = '';
    usernameController.text = '';
  }

  back() {
    // Get.back();
    // Get.lazyPut(() => UsersController());
    Get.find<AuthController>().back('signupPage');
  }
}
