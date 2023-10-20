import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/controller/main_controller.dart';
import 'package:train/page/login_page.dart';
import 'package:train/util/routes.dart';
// import 'package:train/login_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Main Page ~.~'),
          TextButton(
              // onPressed: () {
              //   Get.toNamed(AppRoutes.login);
              // },
              onPressed: controller.toLogin,
              child: const Text('로그인으로 이동')),
        ]),
      ),
    );
  }
}
