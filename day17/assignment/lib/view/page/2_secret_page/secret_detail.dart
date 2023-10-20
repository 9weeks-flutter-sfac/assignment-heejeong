// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment/controller/secretDetail_controller.dart';
import 'package:assignment/controller/secretPage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretDetail extends GetView<secretDetailController> {
  const SecretDetail({super.key});
  static const String route = '/secretDetail';

  @override
  Widget build(BuildContext context) {
    var talkRoom = Get.find<SecretPageController>().talkRoom;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: controller.back,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          talkRoom['secretTitle'],
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.amber,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(talkRoom['backgroundImageUrl']),
                  opacity: 0.3,
                  fit: BoxFit.cover)),
          child: SafeArea(child: Obx(() {
            return ListView.builder(
              itemCount: controller.secretsData.length,
              itemBuilder: (context, index) {
                controller.avatarList.shuffle(controller.random);
                String? secret = controller.secretsData[index].secret;
                String? authorName = controller.secretsData[index].authorName;

                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      controller.avatarList[0],
                    ),
                  ),
                  title: secret != null ? Text(secret) : SizedBox(),
                  subtitle: authorName != null ? Text(authorName) : Text('익명'),
                );
              },
            );
          }))),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.openSecretUpload,
        child: Icon(Icons.add),
      ),
    );
  }
}
