import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/view/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }

  //로그아웃을 하고 난 후
  //로그인 페이지에 id, pw 텍스트 필드에 저장된 값이 나옴
  logout() {
    idController.text = '';
    pwController.text = '';
  }

  signup() {
    Get.toNamed(SignupPage.route);
  }
}
