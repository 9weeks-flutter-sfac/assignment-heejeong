import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/view/login_page.dart';
import 'package:assignment/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),

      //어플이 실행되자마자 메모리에 올림
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),

      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage())
      ],
      home: Scaffold(
          body: Center(
        child: TextButton(
          onPressed: () => Get.toNamed(LoginPage.route),
          child: const Text('Hello World'),
        ),
      )),
    );
  }
}
