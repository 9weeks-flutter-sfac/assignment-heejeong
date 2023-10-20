import 'package:assignment/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  late Future usersData; // 데이터 가져오기 결과

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usersData = getData();
    print('usersData : ${usersData}');
  }

  Future getData() async {
    Dio dio = Dio();
    try {
      var res = await dio.get(ApiRoutes.baseUrl + ApiRoutes.users); //데이터 요청
      print('res : ${res}');
      // await Future.delayed(
      //     Duration(milliseconds: 1500)); //shimmer 화면을 출력하기 위한 딜레이
      if (res.statusCode == 200) {
        // return res.data['body']; //결과 리턴
        print(res.data['items']);
        return res.data['items'];
      }
    } catch (e) {
      print(e);
    }
  }
}
