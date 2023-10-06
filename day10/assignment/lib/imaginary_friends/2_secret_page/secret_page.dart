import 'package:assignment/imaginary_friends/2_secret_page/secret_detail.dart';
import 'package:flutter/material.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  List<Map<String, String>> concepts = [
    {
      'thumbnail' : 'https://plus.unsplash.com/premium_photo-1692951205720-49f0832fcc1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzM3xxUFlzRHp2Sk9ZY3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
      'title' : '소심이들',
      'subtitle' : '극 I 모여라'
    },
    {
      'thumbnail' : 'https://images.unsplash.com/photo-1667056849526-4bd096328f6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUyfEJuLURqcmNCcndvfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      'title' : '사고뭉치들',
      'subtitle' : '말광량이 모여라'
    },
    {
      'thumbnail' : 'https://images.unsplash.com/photo-1695043722490-72207a74a7be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
      'title' : '찐 맛집',
      'subtitle' : '나만의 맛집 공유'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('소근소근', style: TextStyle(color: Colors.amber[800]),),
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
          image: DecorationImage(image: NetworkImage(
            'https://images.unsplash.com/photo-1696254500521-2ab55813c61d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIzfHFQWXNEenZKT1ljfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
            fit: BoxFit.cover
          )
        ),

        child: ListView.builder(
          itemCount: concepts.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SecretDetail(
                                secretTitle: concepts[index]['title']!,
                                backgroundImageUrl: concepts[index]['thumbnail']!,
                              )
                            )
                          ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(concepts[index]['thumbnail']!),
                ),
                title: Text(concepts[index]['title']!),
                subtitle: Text(concepts[index]['subtitle']!),
              )
            );
          }
          ),
      )
    );
  }
}