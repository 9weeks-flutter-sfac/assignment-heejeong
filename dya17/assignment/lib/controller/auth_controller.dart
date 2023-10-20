import 'package:assignment/controller/main_controller.dart';
// import 'package:assignment/model/document.dart';
import 'package:assignment/model/user.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:assignment/view/page/1_main_page/main_page.dart';
import 'package:assignment/view/page/login_page.dart';
// import 'package:assignment/view/page/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final RxInt _singupflag = 0.obs;
  // final RxList<Document> _documents = RxList();
  final RxnString _token = RxnString();
  Dio dio = Dio();
  // SharedPreferences? prefs;

  User? get user => _user.value;
  // List<Document> get documents => _documents.value;
  RxnString get token => _token;

  login(String id, String pw) async {
    //http://52.79.115.43:8090/api/collections/users/auth-with-password
    //id : Teddy
    //pw : sfac12341234
    dio.options.baseUrl = 'http://52.79.115.43:8090';
    try {
      var res = await dio.post(dio.options.baseUrl + ApiRoutes.authWithPassword,
          data: {'identity': id, 'password': pw});
      if (res.statusCode == 200) {
        print('res.data : ${res.data}');
        var user = User.fromMap(res.data['record']);
        var token = res.data['token'];
        print('user : ${user}');
        print('token : ${token}');
        _user(user);
        _token(token);
        print('_user.value : ${_user.value}');
      }
    } on DioError catch (e) {
      print('e.message : ${e.message}');
      print('e.requestOptions.path : ${e.requestOptions.path}');
    }
  }

  logout() {
    _user.value = null;
  }

  //User가 바뀌면 실행됌
  _handleAuthChanged(User? data) {
    print(data);
    if (data != null) {
      //Get.to
      //메인페이지로 이동
      // Get.put(MainPageController);
      Get.toNamed(MainPage.route);
      return;
    }
    //다시 로그인 시
    //전 메인컨트롤러에 있던 pagecontroller와
    //현재 페이지의 controller와 공유가 되어 에러 발생
    //각 스크롤 뷰에 대해 별도의 PageController를 생성 및 사용해야 함
    //Get.toNamed(LoginPage.route);

    //로그인페이지로 이동
    //전 페이지가 닫히고 전 페이지의 컨트롤러가 삭제됨
    //offToNamed, offNamed 동일
    //offToNamed: 화면을 추가한 후, 이전 화면을 제거
    //offNamed: 현재 화면을 제거하고, 새로운 화면을 추가
    Get.offNamed(LoginPage.route);

    // 로그아웃 후에 다시 MainController를 생성
    // Get.lazyPut(() => MainController()); 다시 살려야함
    return;
  }

  signup(String email, String pw, String pwCon, String username) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;
    try {
      var res = await dio.post(dio.options.baseUrl + ApiRoutes.usersRecords,
          data: {
            'email': email,
            'password': pw,
            'passwordConfirm': pwCon,
            'username': username
          });
      if (res.statusCode == 200) {
        print(res.data);
        _singupflag(_singupflag == 0 ? 1 : 0);
      }
    } on DioError catch (e) {
      print('e.message : ${e.message}');
      print('e.requestOptions.path : ${e.requestOptions.path}');
    }
  }

  _handleSignup(int flag) {
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    //_user가 새로 들어올 때 callback(userData)에 user가 들어감
    ever(_user, _handleAuthChanged);
    ever(_singupflag, _handleSignup);
  }

  // readDocuments() async {
  //   Dio dio = Dio();
  //   dio.options.baseUrl = 'http://52.79.115.43:8090';

  //   var res = await dio.get(dio.options.baseUrl + ApiRoutes.records,
  //       options: Options(
  //           // 인증 토큰을 설정
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //           }));
  //   if (res.statusCode == 200) {
  //     print('with token, res.data : ${res.data['items']}');
  //     List<Document> documents = [];
  //     for (var i = 0; i < res.data['totalItems']; i++) {
  //       documents.add(Document.fromMap(res.data['items'][i]));
  //     }
  //     print('documents: ${documents}');
  //     _documents(documents);
  //     print('_documents: ${_documents.value}');
  //   }
  // }
}
