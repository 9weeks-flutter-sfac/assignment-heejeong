import 'package:get/get.dart';
import 'package:train/page/login_page.dart';

class MainController extends GetxController {
  toLogin() {
    Get.toNamed(LoginPage.route);
  }
}
