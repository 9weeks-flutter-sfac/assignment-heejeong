import 'package:get/get.dart';
import 'package:train/controller/login_controller.dart';
import 'package:train/page/login_page.dart';
import 'package:train/page/main_page.dart';
import 'package:train/util/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      //initialBinding 사용할 것이기 때문에 주석처리함
      // binding: BindingsBuilder(() {
      //   Get.put(LoginController());
      // })
    ),
  ];
}
