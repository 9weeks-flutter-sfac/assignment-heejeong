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
  List<XFile?> selectedImages = [null, null, null, null];
  //_변수명: 해당 클레스(파일) 내에서만 쓸 것이라고 할 때 사용
  var _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("포토네컷"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),

            //asMap() 사용
            /* child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            //asMap() : <index, value>값을 가짐
            //e.key : key가 리스트의 index를 나타냄
            //e.value : value가 리스트의 내용을 나타냄
            children: selectedImages.asMap().entries.map((e) => 
              //column의 높이를 4개의 container로 동일하게 나누기 위해
              //Expanded위젯 사용
              Expanded(
                flex: 1,
                child: InkWell(
                  onDoubleTap: () => setState(() => selectedImages[e.key] = null),
                  onTap: () async{
                    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
                    if(image != null){
                      selectedImages[e.key] = image;
                      print('이미지가 선택되었습니다');
                      setState(() {});
                    } else{
                      print('아무것도 선택되지 않았습니다');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      image: selectedImages[e.key] != null ? 
                        DecorationImage(
                          image: FileImage(File(selectedImages[e.key]!.path)),
                          fit: BoxFit.cover
                        ) : null
                    ),
                    // child: selectedImages[0] != null ?
                    //   Image.file(File(selectedImages[0]!.path)):null,
                  )
                )),
            ).toList()
          ) */

          //ListView.builder 사용
          child: ListView.builder(
            itemCount: selectedImages.length,
            itemBuilder: (context, index) =>
                InkWell(
                  onDoubleTap: () => setState(() => selectedImages[index] = null),
                  onTap: () async{
                    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
                    if(image != null){
                      selectedImages[index] = image;
                      print('이미지가 선택되었습니다');
                      setState(() {});
                    } else{
                      print('아무것도 선택되지 않았습니다');
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      image: selectedImages[index] != null ? 
                        DecorationImage(
                          image: FileImage(File(selectedImages[index]!.path)),
                          fit: BoxFit.cover
                        ) : null
                    ),
                    // child: selectedImages[0] != null ?
                    //   Image.file(File(selectedImages[0]!.path)):null,
                  )
                )
          ),
          ),
        ),
      ),
    );
  }
}