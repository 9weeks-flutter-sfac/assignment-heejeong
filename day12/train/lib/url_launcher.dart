import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_String.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // ListTile(
            //   title: Text('이테디'),
            //   trailing: IconButton(
            //     icon: Icon(Icons.call),
            //     onPressed: () {
            //       // launchUrlString('sms: +8210-0000-0000');
            //       launchUrlString('https://sniperfactory.com/');
            //     },
            //   ),
            // ),

            // CachedNetworkImage(
            //   imageUrl: 'https://robohash.org/411.png?set=set1&size=150x150',
            // ),
            // CircleAvatar(
            //   backgroundImage: CachedNetworkImageProvider(
            //       'https://robohash.org/411.png?set=set1&size=150x150'),
            // ),

            Text(DateFormat('y/M/d EE').format(DateTime(2023, 10, 10))),
            Text('40000'),
            Text(NumberFormat.currency(locale: 'ko_KR', symbol: 'KRW')
                .format(400000))
          ],
        ),
      ),
    );
  }
}
