import 'package:assignment/imaginary_friends/2_secret_page/secret_page.dart';
import 'package:assignment/imaginary_friends/4_friends/imaginary_friends.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://cdn-icons-png.flaticon.com/256/4860/4860916.png",
            width: 120, height: 120,),
            
            Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecretPage()
                      )
                    );
                  }, 
                  child: Text('소근소근', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImaginaryFriends()
                      )
                    );
                  }, 
                  child: Text('상상 친구들', style: TextStyle(fontWeight: FontWeight.bold))
                ),
                TextButton(
                  onPressed: (){}, 
                  child: Text('비밀 공유', style: TextStyle(fontWeight: FontWeight.bold))
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}