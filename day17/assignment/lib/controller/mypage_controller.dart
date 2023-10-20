import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  logout() {
    //텍스트값을 초기화 안해주면 다시 로그인 페이지 들어갈 때
    //사용하던 값이 남아있음
    Get.find<LoginController>().logout();
    Get.find<SignupController>().logout();
    Get.find<AuthController>().logout();
  }

  back() {
    Get.find<AuthController>().back('myPage');
  }
}
