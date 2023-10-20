import 'package:assignment/controller/coinController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    CoinController coinController = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "상점",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Obx(
              () => Text(
                "현재 보유한 코인 : ${coinController.coin}",
              ),
            ),
            TextButton(
                onPressed: () {
                  coinController.coin.value = 0;
                },
                child: Text('코인리셋', style: TextStyle(color: Colors.blue)))
          ],
        ),
      ),
    );
  }
}
