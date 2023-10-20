import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  var res = await dio.get(
      'http://52.79.115.43:8090/api/collections/users/records?sort=-created');
  print(res);
}
