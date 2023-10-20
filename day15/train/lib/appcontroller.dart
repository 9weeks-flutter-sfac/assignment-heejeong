import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  // RxList<String> memos = RxList<String>();
  Rxn<User> currentUser = Rxn();

  //새로고침 필수
  //처음 한번만 실행되기 때문에
  void onInit() {
    super.onInit();

    // ever(memos, (newValue) {
    //   print(newValue);
    //   print('변경감지: ${memos.length}');
    // });

    // //ever(감시대상, 바뀌면 할일)
    // print("[GetX] AppController 생성됨");

    ever(currentUser, (newValue) {
      if(newValue!=null){
        Get.to(()=>MainPage());
      }else{
        Get.to(LoginPage());
      }
    })
  }
}
