void main(){
  print("hello");
  printWecomeMsg();
  print(getAge());
  print(getFollowers());
  print(getName("뷔"));
}

// String getNickname(){
//   var user = //서버통신해서 유저정보 가져오기//;
//   return user.name;
// }

List<String> getFollowers(){
  // var getFollowers = //서버통신해서 유저정보 가져오기//;
  // return getFollowers;
  return ["제니", "뷔"];
}

int getAge(){
  return 200;
}

String getName(String name){
  return name;
}

void printWecomeMsg(){
  print("새로운 유저가 입장했습니다");
  print("모두 환하게 반겨주세요");
}