import 'dart:async';

import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coin = RxInt(0);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      coin += 1;
      print(coin);
      if (coin % 10 == 0) {
        print('코인코인코인');
        Get.snackbar('코인 ${coin} 돌파', '축하합니다!');
      }
    });
  }
}
