import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/user.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  RxList<User> usersData = <User>[].obs; // 데이터 가져오기 결과

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  Future getData() async {
    Dio dio = Dio();
    try {
      var res = await dio.get(ApiRoutes.baseUrl + ApiRoutes.users); //데이터 요청

      if (res.statusCode == 200) {
        usersData.assignAll(
            res.data['items'].map<User>((e) => User.fromMap(e)).toList());
      }
    } catch (e) {
      print(e);
    }
  }

  back() {
    Get.find<AuthController>().back('users');
  }
}
