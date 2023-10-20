import 'dart:async';
// import 'dart:ffi';

import 'package:assignment/controller/coinController.dart';
import 'package:assignment/view/store_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CoinController coinController = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Current coin : ${coinController.coin}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            SizedBox(
              height: 8,
            ),
            TextButton(
                onPressed: () {
                  Get.to(StorePage());
                },
                child: Text(
                  '상점으로 이동하기',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
