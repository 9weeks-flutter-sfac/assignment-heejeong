import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/controller/login_controller.dart';

//GetView<controller> : put 된 controller를 find 하여 controller 사용하겠다는 것
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(LoginController());
    // var controller = Get.find<LoginController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.idController,
                decoration: InputDecoration(
                  hintText: 'ID',
                ),
              ),
              TextField(
                controller: controller.pwController,
                decoration: const InputDecoration(
                  hintText: 'PW',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: controller.login, child: Text('로그인'))
            ],
          ),
        ),
      ),
    );
  }
}
