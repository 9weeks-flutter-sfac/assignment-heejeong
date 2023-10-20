import 'package:assignment/controller/secreUpload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretUpload extends GetView<SecretUploadController> {
  const SecretUpload({super.key});
  static const String route = '/secretUpload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: controller.back,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          '쉿!비밀이야',
          style: TextStyle(color: Colors.pink[100]),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 248, 187, 208),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1690566250459-453c1d98846e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDI5MnxxUFlzRHp2Sk9ZY3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                opacity: 0.3,
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.textEditingController,
              minLines: 6,
              maxLines: 8,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                label: Text('비밀'),
                hintText: "공유하고 싶은 비밀을 작성해주세요.",
                border: OutlineInputBorder(
                  // 테두리 스타일 설정
                  borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
                  borderSide: BorderSide(color: Colors.blue), // 테두리 색상 설정
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: controller.secretRecord, child: Text('공유하기'))
          ],
        ),
      ),
    );
  }
}
