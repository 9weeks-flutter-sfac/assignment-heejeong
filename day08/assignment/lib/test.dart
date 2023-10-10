import 'package:http/http.dart' as http;

void main() {
  sendPostRequest();
}


void sendPostRequest() async {
  // 요청을 보낼 URL을 설정합니다. {integer} 부분은 원하는 정수로 대체해야 합니다.
  String url = 'https://sniperfactory.com/sfac/http_assignment_110';

  // 요청 헤더를 설정합니다.
  Map<String, String> headers = {
    'User-Agent': 'SniperFactoryBrowser',
    'Authorization': 'Bearer ey-12312312312312',
  };

  // 요청 본문 데이터를 만듭니다. 필요에 따라 데이터를 추가하세요.
  // 예: Map<String, dynamic> data = {'key': 'value'};

  // POST 요청을 보냅니다.
  http.Response response = await http.post(
    Uri.parse(url),
    headers: headers,
    // body: data != null ? jsonEncode(data) : null, // 요청 본문 데이터 추가 예시
  );

  // 응답을 확인합니다.
  if (response.statusCode == 200) {
    print('요청이 성공적으로 처리되었습니다.');
    print('응답 내용: ${response.body}');
  } else {
    print('요청 실패. 상태 코드: ${response.statusCode}');
  }
}
