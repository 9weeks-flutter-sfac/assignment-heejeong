import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:assignment/controller/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImaginaryFriends extends GetView<UsersController> {
  const ImaginaryFriends({super.key});
  static const String route = '/users';

  @override
  Widget build(BuildContext context) {
    List<String> avatarList = [
      'https://cdn-icons-png.flaticon.com/256/4860/4860828.png',
      'https://cdn-icons-png.flaticon.com/256/4860/4860766.png',
      'https://cdn-icons-png.flaticon.com/256/4860/4860774.png',
      'https://cdn-icons-png.flaticon.com/256/4860/4860869.png',
      'https://cdn-icons-png.flaticon.com/256/4860/4860895.png',
      'https://cdn-icons-png.flaticon.com/256/4860/4860797.png'
    ];
    final random = Random();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: controller.back,
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text(
            '상상 친구들',
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
          padding: const EdgeInsets.only(top: 27),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1695381517206-2be6c8adce33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDM0fHFQWXNEenZKT1ljfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover)),
          child: SafeArea(child: Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
                mainAxisSpacing: 10, //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
              itemCount: controller.usersData.length,
              itemBuilder: (context, index) {
                avatarList.shuffle(random);

                return ZoomIn(
                    delay: Duration(milliseconds: 200 * index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          child: Image.network(
                            avatarList[0],
                          ),
                        ),
                        controller.usersData[index].name != ''
                            ? Text(
                                controller.usersData[index].name!,
                                style: TextStyle(color: Colors.white),
                              )
                            : Text('익명', style: TextStyle(color: Colors.white)),
                      ],
                    ));
              },
            );
          })),
        ));
  }
}
