import 'dart:math';

import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/secret.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:assignment/view/page/3_secret_upload/secret_upload.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class secretDetailController extends GetxController {
  RxList<Secret> secretsData = <Secret>[].obs; // 데이터 가져오기 결과
  RxMap<String, dynamic> secretrecord = RxMap<String, dynamic>();
  List<String> avatarList = [
    'https://cdn-icons-png.flaticon.com/256/4860/4860828.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860766.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860774.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860869.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860895.png',
    'https://cdn-icons-png.flaticon.com/256/4860/4860797.png'
  ];
  final random = Random();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    print('secretsData : ${secretsData}');
  }

  Future getData() async {
    Dio dio = Dio();
    try {
      var res = await dio.get(ApiRoutes.baseUrl + ApiRoutes.secrets); //데이터 요청

      if (res.statusCode == 200) {
        secretsData.assignAll(
            res.data['items'].map<Secret>((e) => Secret.fromMap(e)).toList());
      }
    } catch (e) {
      print(e);
    }
  }

  //비밀 업로드
  openSecretUpload() async {
    Get.toNamed(SecretUpload.route);
    final result = await Get.find<AuthController>().secretRecord;

    // 이전 화면으로부터 데이터를 받아와서 업로드 내용 갱신
    if (result != null) {
      secretsData.addAll([Secret.fromMap(result)]);
      print('secretsData : ${secretsData[-1]}');
    }
  }

  back() {
    Get.find<AuthController>().back('secretDetail');
  }
}
