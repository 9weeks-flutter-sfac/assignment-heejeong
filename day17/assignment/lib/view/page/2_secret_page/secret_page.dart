import 'package:animate_do/animate_do.dart';
import 'package:assignment/controller/secretPage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretPage extends GetView<SecretPageController> {
  const SecretPage({super.key});
  static const String route = '/secretPage';

  @override
  Widget build(BuildContext context) {
    //다이얼로그로 concepts 리스트에 concept 추가
    //Dialog란, 앱에서 팝업창처럼 화면위에 화면을 띄우는것
    showResultDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 300,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: controller.titleTextEditingController,
                        decoration: InputDecoration(
                          label: Text('TITLE'),
                          hintText: "공유하고 싶은 CONCEPT",
                          border: OutlineInputBorder(
                            // 테두리 스타일 설정
                            borderRadius:
                                BorderRadius.circular(10.0), // 둥근 모서리 설정
                            borderSide:
                                BorderSide(color: Colors.blue), // 테두리 색상 설정
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: controller.subtitleTextEditingController,
                        decoration: InputDecoration(
                          label: Text('SUBTITLE'),
                          hintText: "공유하고 싶은 CONCEPT의 소개",
                          border: OutlineInputBorder(
                            // 테두리 스타일 설정
                            borderRadius:
                                BorderRadius.circular(10.0), // 둥근 모서리 설정
                            borderSide:
                                BorderSide(color: Colors.blue), // 테두리 색상 설정
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: controller.thumbUrlTextEditingController,
                        decoration: InputDecoration(
                          label: Text('THUMBNAIL'),
                          hintText: "썸네일의 주소",
                          border: OutlineInputBorder(
                            // 테두리 스타일 설정
                            borderRadius:
                                BorderRadius.circular(10.0), // 둥근 모서리 설정
                            borderSide:
                                BorderSide(color: Colors.blue), // 테두리 색상 설정
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed:
                              controller.onChangedSecret, // 버튼을 눌렀을 때 함수 실행

                          child: Text('추가하기'))
                    ]),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: controller.back,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          '소근소근',
          style: TextStyle(color: Colors.amber[800]),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 255, 143, 0),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1696254500521-2ab55813c61d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzfHFQWXNEenZKT1ljfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover)),

        //appbar까지 영역확장되어 있기 때문에 SafeArea 사용
        child: SafeArea(child: Obx(() {
          return ListView.builder(
              itemCount: controller.concepts.length,
              itemBuilder: (context, index) {
                print(controller.concepts[index]);
                return InkWell(
                    onTap: () => controller.toSecretDetail(index),
                    //애니메이션넣기
                    child: FadeInRight(
                        child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: controller.concepts[index]
                                    ['thumbnail'] !=
                                null
                            ? NetworkImage(
                                controller.concepts[index]['thumbnail']!)
                            : NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1692951205720-49f0832fcc1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzM3xxUFlzRHp2Sk9ZY3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                      ),
                      title: controller.concepts[index]['title'] != null
                          ? Text(controller.concepts[index]['title']!)
                          : Text(''),
                      subtitle: controller.concepts[index]['subtitle'] != null
                          ? Text(controller.concepts[index]['subtitle']!)
                          : Text(''),
                    )));
              });
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showResultDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
