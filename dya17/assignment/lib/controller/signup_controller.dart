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
}
