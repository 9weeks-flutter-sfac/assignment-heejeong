import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var token = Get.find<AuthController>().token;
    print(token);
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/256/4860/4860916.png",
              width: 120,
              height: 120,
            ),
            Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: controller.toSecretPage,
                      child: Text(
                        '소근소근',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: controller.toUsers,
                      child: Text('상상 친구들',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  token.value == null
                      ? TextButton(
                          onPressed: controller.toLogin,
                          child: Text('로그인/회원가입',
                              style: TextStyle(fontWeight: FontWeight.bold)))
                      : TextButton(
                          onPressed: controller.toMyPage,
                          child: Text('마이페이지',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                ])
          ],
        ),
      ),
    );
  }
}
