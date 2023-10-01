import 'package:http/http.dart' as http;

void main() async {
  var url = 'https://sniperfactory.com/sfac/http_only_get';
  var response = await http.get(Uri.parse(url));
  print(response.statusCode); //'200'이 나오면 옳게된것
  print(response.body);
}