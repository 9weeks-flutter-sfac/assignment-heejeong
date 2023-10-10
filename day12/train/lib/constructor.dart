class User {
  //멤버변수
  String name;
  String? phone;

  //이름없는 생성자
  User(this.name, this.phone);

  //이름있는 생성자
  User.withName({required String inputName, String? inputPhone})
      : name = inputName,
        phone = inputPhone;
  // User.withName(String inputName, String? inputPhone)
  //     : name = inputName,
  //       phone = inputPhone;
  // User.withAnonymous() : name = 'Anony';
}

void main() {
  //익명으로 행동할 때 사용
  // var user = User.withAnonymous();
  // print(user);

  User.withName(inputName: '이테디');
  User.withName(inputName: '이테', inputPhone: '010-0000-1111');
}
