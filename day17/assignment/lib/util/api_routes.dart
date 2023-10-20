class ApiRoutes {
  static const String baseUrl = 'http://52.79.115.43:8090';

  //유저
  static const String users = '/api/collections/users/records?sort=-created';
  //로그인
  static const String authWithPassword =
      '/api/collections/users/auth-with-password';
  //회원가입
  static const String usersRecords = '/api/collections/users/records';
  //비밀리스트
  static const String secrets =
      '/api/collections/secrets/records?sort=-created';
  //비밀 업로드
  static const String secretsRecords = '/api/collections/secrets/records';
}
