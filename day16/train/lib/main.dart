import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/controller/login_controller.dart';
import 'package:train/controller/main_controller.dart';
import 'package:train/page/login_page.dart';
import 'package:train/page/main_page.dart';
import 'package:train/util/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        // Get.put(LoginController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: AppPages.pages,
      theme: ThemeData(useMaterial3: true),

      //initialBinding 속성 사용 안할 때
      //getPages가 실행되기 전에 home이 실행되어
      //GetView에서 controller를 찾지 못해 error 발생
      home: const MainPage(),

      //initialBinding 속성 사용 안할 때
      //getPages가 실행된 후 실행
      // initialRoute: LoginPage.route,
    );
  }
}
