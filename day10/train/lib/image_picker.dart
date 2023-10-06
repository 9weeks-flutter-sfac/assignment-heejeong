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
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    var imagePicker = ImagePicker();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //iOS에서 XFile 이미지 출력
              // Image.asset()
              //android에서 XFile 이미지를 출력
              if(selectedImage != null)
                // Image.file(File(selectedImage!.path)),
                CircleAvatar(
                  radius: 43,
                  backgroundImage: FileImage(File(selectedImage!.path)),
                ),

              TextButton(
                onPressed: () async{
                  var image = await imagePicker.pickImage(source: ImageSource.gallery);
                  if(image != null){
                    selectedImage = image;
                    print('이미지가 선택되었습니다');
                    setState(() {});
                  } else{
                    print('아무것도 선택되지 않았습니다');
                  }
                }, 
                child: Text('이미지 불러오기')
              )
            ],
          ),
        ),
      ),
    );
  }
}