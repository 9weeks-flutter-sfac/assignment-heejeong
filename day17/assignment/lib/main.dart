import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/controller/mypage_controller.dart';
import 'package:assignment/controller/secreUpload_controller.dart';
import 'package:assignment/controller/secretDetail_controller.dart';
import 'package:assignment/controller/secretPage_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/controller/users_controller.dart';
import 'package:assignment/view/page/1_main_page/main_page.dart';
import 'package:assignment/view/page/2_secret_page/secret_detail.dart';
import 'package:assignment/view/page/2_secret_page/secret_page.dart';
import 'package:assignment/view/page/3_secret_upload/secret_upload.dart';
import 'package:assignment/view/page/4_friends/imaginary_friends.dart';
import 'package:assignment/view/page/mypage.dart';
import 'package:assignment/view/page/signup_page.dart';
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
        Get.lazyPut(() => SecretPageController());
        Get.lazyPut(() => secretDetailController());
        Get.lazyPut(() => SecretUploadController());
        Get.lazyPut(() => MyPageController());
      }),

      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage()),
        GetPage(name: SignupPage.route, page: () => const SignupPage()),
        GetPage(
            name: ImaginaryFriends.route, page: () => const ImaginaryFriends()),
        GetPage(name: SecretPage.route, page: () => const SecretPage()),
        GetPage(name: SecretDetail.route, page: () => const SecretDetail()),
        GetPage(name: SecretUpload.route, page: () => const SecretUpload()),
        GetPage(name: MyPage.route, page: () => const MyPage()),
      ],
      home: MainPage(),
    );
  }
}
