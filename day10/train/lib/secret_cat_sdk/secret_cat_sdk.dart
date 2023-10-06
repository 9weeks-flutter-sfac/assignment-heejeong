import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* TextButton(
                onPressed: () async{
                  //서버에 올리는 동안 에러가 발생할 수 있기 때문에
                  //await을 주어 확인(print)
                  //추가할  때 제일 첫 번째로 들어감
                  var secret = await SecretCatApi.addSecret('새로운 비밀입니다. 제 비밀이 궁금하신가요?');
                  print(secret);
                }, 
                child: Text('비밀 업로드')
              ),
              TextButton(
                onPressed: () async{
                  //서버에 올리는 동안 에러가 발생할 수 있기 때문에
                  //await을 주어 확인(print)
                  var secrets = await SecretCatApi.fetchSecrets();
                  print(secrets.first);
                }, 
                child: Text('비밀 확인')
              ), */
              FutureBuilder(
                future: SecretCatApi.fetchSecrets(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    print(snapshot.data.runtimeType);
                    // return (Text(snapshot.data!.first.secret));
                    return ListTile(
                      leading: snapshot.data!.first.author?.avatar != null
                        ? CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!.first.author!.avatar!),
                        ) : CircleAvatar(
                          // child: Text(snapshot.data!.first.author!.username[0]),
                          child: Image.network('https://cdn-icons-png.flaticon.com/256/4860/4860934.png'),
                        ),
                      title: snapshot.data!.first.author?.username != null
                        ? Text(snapshot.data!.first.author!.username) : Text('익명'),
                      subtitle: snapshot.data!.first.author?.id != null
                        ? Text(snapshot.data!.first.author!.id) : Text('익명'),
                    );
                  }
                  return LinearProgressIndicator();
                },
              )
            ],
          )
        ),
      ),
    );
  }
}