import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/mypage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});
  static const String route = '/myPage';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: controller.back,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text(user.name!),
            subtitle: Text(user.id),
          ),
          ListTile(
            title: Text('로그아웃하기'),
            leading: Icon(Icons.logout),
            onTap: () {
              controller.logout();
            },
          )
        ]),
      ),
    );
  }
}
