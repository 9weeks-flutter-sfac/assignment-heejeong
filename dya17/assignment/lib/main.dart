import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/controller/users_controller.dart';
import 'package:assignment/view/page/1_main_page/main_page.dart';
import 'package:assignment/view/page/4_friends/imaginary_friends.dart';
import 'package:assignment/view/page/signup_page.dart';
// import 'package:assignment/view/page/main_page.dart';
import 'package:assignment/view/page/login_page.dart';
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
        Get.lazyPut(() => SignupController());
        Get.lazyPut(() => UsersController());
      }),

      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage()),
        GetPage(name: SignupPage.route, page: () => const SignupPage()),
        GetPage(
            name: ImaginaryFriends.route, page: () => const ImaginaryFriends()),
      ],
      home: Scaffold(
          body: Center(
        child: TextButton(
          onPressed: () => Get.toNamed(MainPage.route),
          child: const Text('비밀친구들\n시작'),
        ),
      )),
    );
  }
}
