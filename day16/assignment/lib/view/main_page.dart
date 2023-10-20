import 'dart:ffi';

import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    // var token = Get.find<AuthController>().token;
    // var documents = controller.documents;

    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.curPage.value,
            onTap: controller.onPageTapped,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
            ],
          )),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(children: [
              Text(
                '${user.username}님 안녕하세요',
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(child: Obx(() {
                return ListView.builder(
                  itemCount: controller.documents.length,
                  itemBuilder: (context, index) {
                    print('title: ' + controller.documents[index].title);
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(controller.documents[index].title,
                                        style: TextStyle(
                                            backgroundColor: Colors.amber,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      controller.documents[index].content,
                                    )
                                  ])),
                          controller.documents[index].attachment_url != null
                              ? Image.network(
                                  controller.documents[index].attachment_url!)
                              : SizedBox()
                        ]);
                  },
                );
              }))
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                leading: CircleAvatar(),
                title: Text(user.username),
                subtitle: Text(user.id),
              ),
              ListTile(
                title: Text('로그아웃하기'),
                leading: Icon(Icons.logout),
                // onTap: () => controller.logout(),
                onTap: () {
                  // controller.curPage(0);
                  // controller.pageController.jumpTo(0);
                  // controller.pageController.dispose();
                  controller.logout();
                },
              )
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.readDocuments();
        },
        child: Icon(Icons.refresh_sharp),
      ),
    );
  }
}
