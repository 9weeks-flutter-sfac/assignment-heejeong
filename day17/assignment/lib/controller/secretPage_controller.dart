import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/view/page/2_secret_page/secret_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretPageController extends GetxController {
  var titleTextEditingController = TextEditingController();
  var subtitleTextEditingController = TextEditingController();
  var thumbUrlTextEditingController = TextEditingController();
  RxList<Map<String, String>> concepts = [
    {
      'thumbnail':
          'https://plus.unsplash.com/premium_photo-1692951205720-49f0832fcc1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzM3xxUFlzRHp2Sk9ZY3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
      'title': '소심이들',
      'subtitle': '극 I 모여라'
    },
    {
      'thumbnail':
          'https://images.unsplash.com/photo-1667056849526-4bd096328f6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUyfEJuLURqcmNCcndvfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      'title': '사고뭉치들',
      'subtitle': '말광량이 모여라'
    },
    {
      'thumbnail':
          'https://images.unsplash.com/photo-1695043722490-72207a74a7be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
      'title': '찐 맛집',
      'subtitle': '나만의 맛집 공유'
    },
  ].obs;
  Map<String, String> _talkRoom = RxMap<String, String>();

  Map get talkRoom => _talkRoom;

  toSecretDetail(int index) {
    _talkRoom = {
      'secretTitle': concepts[index]['title'] ?? '',
      'backgroundImageUrl': concepts[index]['thumbnail'] ?? ''
    };
    Get.toNamed(SecretDetail.route);
  }

  //다이얼로그 버튼 핸들링
  onChangedSecret() {
    concepts.add({
      'thumbnail': thumbUrlTextEditingController.text,
      'title': titleTextEditingController.text,
      'subtitle': subtitleTextEditingController.text
    });

    //텍스트필드의 텍스트 초기화
    titleTextEditingController.text = '';
    subtitleTextEditingController.text = '';
    thumbUrlTextEditingController.text = '';
    //대화상자 창 닫기
    Get.back();
  }

  back() {
    // Get.back();
    // Get.lazyPut(() => UsersController());
    Get.find<AuthController>().back('secretPage');
  }
}
