import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<XFile?> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    var imagePicker = ImagePicker();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("포토네컷"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //column의 높이를 4개의 container로 동일하게 나누기 위해
              //Expanded위젯 사용
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () async{
                    var image = await imagePicker.pickImage(source: ImageSource.gallery);
                    if(image != null){
                      selectedImages[0] = image;
                      print('이미지가 선택되었습니다');
                      setState(() {});
                    } else{
                      print('아무것도 선택되지 않았습니다');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    height: 20,
                    color: Colors.black45,
                    child: selectedImages[0] != null ?
                      Image.file(File(selectedImages[0]!.path)):null,
                  )
                )),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 20,
                  
                  color: Colors.black45,
                  // child: selectedImages[0] != null ?
                  //   Image.file(File(selectedImages[0]!.path)):null,
                )),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 20,
                  
                  color: Colors.black45,
                  // child: selectedImages[0] != null ?
                  //   Image.file(File(selectedImages[0]!.path)):null,
                )),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 20,
                  
                  color: Colors.black45,
                  // child: selectedImages[0] != null ?
                  //   Image.file(File(selectedImages[0]!.path)):null,
                )),

              
            ],
          )),
        ),
      ),
    );
  }
}