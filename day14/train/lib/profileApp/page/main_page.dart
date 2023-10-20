import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:train/profileApp/model/profile.dart';
import 'package:train/profileApp/page/detail_page.dart';
import 'package:animate_do/animate_do.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  List<Profile> profiles = [];

  readUsers() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    dio.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(value.data);
        profiles = data.map((e) => Profile.fromMap(e)).toList();
      }
      ;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: profiles.length,
          itemBuilder: (context, index) => FadeInRight(
                delay: Duration(milliseconds: 100 * index),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://xsgames.co/randomusers/assets/avatars/male/${profiles[index].id}.jpg'),
                  ),
                  title: Text(profiles[index].name),
                  subtitle: Text(profiles[index].email),
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(profile: profiles[index])));
                    },
                  ),
                ),
              )),
    );
  }
}
