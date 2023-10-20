import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/mypage_controller.dart';
import 'package:assignment/controller/secreUpload_controller.dart';
import 'package:assignment/controller/secretDetail_controller.dart';
import 'package:assignment/controller/secretPage_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/controller/users_controller.dart';
import 'package:assignment/model/user.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:assignment/view/page/1_main_page/main_page.dart';
import 'package:assignment/view/page/2_secret_page/secret_detail.dart';
import 'package:assignment/view/page/2_secret_page/secret_page.dart';
import 'package:assignment/view/page/4_friends/imaginary_friends.dart';
import 'package:assignment/view/page/login_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final RxMap<String, dynamic> _secretRecord = RxMap<String, dynamic>();
  final RxnString _token = RxnString();
  Dio dio = Dio();

  User? get user => _user.value;
  RxMap<String, dynamic> get secretRecord => _secretRecord;
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
    _token.value = null;
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
    Get.offNamed(MainPage.route);

    // 로그아웃 후에 다시 MainController를 생성
    Get.lazyPut(() => MyPageController()); //다시 살려야함
    return;
  }

  signup(String email, String pw, String pwCon, String username) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;
    try {
      var res =
          await dio.post(dio.options.baseUrl + ApiRoutes.usersRecords, data: {
        'email': email,
        'password': pw,
        'passwordConfirm': pwCon,
        'username': username,
        'name': username
      });
      if (res.statusCode == 200) {
        print(res.data);
        Get.toNamed(LoginPage.route);
        // _singupflag(!_singupflag.value);
      }
    } on DioError catch (e) {
      print('e.message : ${e.message}');
      print('e.requestOptions.path : ${e.requestOptions.path}');
    }
  }

  getSecretRecord(String data) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;
    try {
      var res =
          await dio.post(dio.options.baseUrl + ApiRoutes.secretsRecords, data: {
        'secret': data,
        'author': _user.value!.id,
        'authorName': _user.value!.name,
      });
      if (res.statusCode == 200) {
        print(res.data);
        _secretRecord(res.data);
        Get.offNamed(SecretDetail.route);
        Get.lazyPut(() => SecretUploadController());
      }
    } on DioError catch (e) {
      print('e.message : ${e.message}');
      print('e.requestOptions.path : ${e.requestOptions.path}');
    }
  }

  //back이랑 _handleBack으로 나누는게 좋은가? back함수만 사용하는게 좋은거아닌가?
  //전 페이지로 갔다가 동일한 페이지로 다시 가면 curPage 변수 값이 안 변하여
  //ever() 이 실행이 안됌
  //따라서 back함수 하나만 작성하기로 함
  back(curPage) {
    // _curPage(curPage);

    switch (curPage) {
      case 'users':
        print('users back please');
        Get.offNamed(MainPage.route);
        Get.lazyPut(() => UsersController());
        break;
      case 'secretPage':
        Get.offNamed(MainPage.route);
        Get.lazyPut(() => SecretPageController());
        return;
      case 'secretDetail':
        Get.offNamed(SecretPage.route);
        Get.lazyPut(() => secretDetailController());
        return;
      case 'secretUpload':
        Get.offNamed(SecretDetail.route);
        Get.lazyPut(() => SecretUploadController());
        return;
      case 'loginPage':
        Get.offNamed(MainPage.route);
        Get.lazyPut(() => LoginController());
        return;
      case 'myPage':
        Get.offNamed(MainPage.route);
        Get.lazyPut(() => MyPageController());
        return;
      case 'signupPage':
        Get.offNamed(MainPage.route);
        Get.lazyPut(() => SignupController());
        return;
    }
  }

  // _handleBack(String data) async {
  //   print(data);
  //   //lazyput이 안됌
  //   //아니면 실행이 됐는데 삭제가 되었거나...후...
  //   // await Future.delayed(Duration.zero, () {
  //   //   Get.back();
  //   // }); // 현재 페이지 닫음

  //   switch (data) {
  //     case 'users':
  //       print('users back please');
  //       Get.offNamed(MainPage.route);
  //       Get.lazyPut(() => UsersController());
  //       break;
  //     case 'secretPage':
  //       Get.offNamed(MainPage.route);
  //       Get.lazyPut(() => SecretPageController());
  //       return;
  //     case 'secretDetail':
  //       Get.offNamed(SecretPage.route);
  //       Get.lazyPut(() => SecretPageController());
  //       return;
  //   }
  // }

  //return은 굳이 왜 해주는 걸까?
  toUsers() {
    if (_token.value != null) {
      Get.toNamed(ImaginaryFriends.route);
      return;
    } else {
      Get.toNamed(LoginPage.route);
      return;
    }
  }

  toSecretPage() {
    if (_token.value != null) {
      Get.toNamed(SecretPage.route);
      return;
    } else {
      Get.toNamed(LoginPage.route);
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
    //_user가 새로 들어올 때 callback(userData)에 user가 들어감
    ever(_user, _handleAuthChanged);
  }
}
