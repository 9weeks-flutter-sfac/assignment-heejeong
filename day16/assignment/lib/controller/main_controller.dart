import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/model/document.dart';
// import 'package:assignment/util/api_routes.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;
  RxList<Document> documents = <Document>[].obs;

  //바텀바의 인덱스 값에 따라 페이지 이동
  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<LoginController>().logout();
    Get.find<AuthController>().logout();
  }

// documents.assignAll():
  // assignAll() 메서드는 Rx 변수에 새로운 값을 할당하고 해당 Rx 변수를 업데이트합니다.
  // 이 메서드를 사용하면 Rx 변수에 새로운 값의 리스트나 데이터를 할당할 수 있으며, Rx 변수 내용이 변경될 때 화면 업데이트를 트리거합니다.
  // 주로 RxList나 RxMap와 함께 사용되며, 이를 통해 목록이나 맵을 업데이트하고 화면에 반영할 수 있습니다.
// documents():
  // documents()는 Rx 변수에 접근하기 위한 게터(Getter) 메서드입니다.
  // 이 메서드를 사용하여 Rx 변수를 읽을 수 있지만, 직접 값을 설정하거나 업데이트할 수는 없습니다.
  // 주로 Rx 변수의 현재 상태를 읽을 때 사용됩니다.
// 따라서 documents.assignAll()를 사용하면 Rx 변수에 새로운 데이터를 할당하고, 해당 데이터의 변경 사항이 documents()로 읽히는 경우에도 화면 업데이트가 자동으로 발생
  readDocuments() async {
    print('maincontroller: ${Get.find<AuthController>().token}');
    if (Get.find<AuthController>().token != null) {
      await Get.find<AuthController>().readDocuments();
      documents.assignAll(Get.find<AuthController>().documents);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInt');
  }
}
