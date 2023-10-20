import 'package:flutter/material.dart';
import 'package:train/profileApp/model/profile.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(profile.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            //겹치는 부분 자르지 않음
            clipBehavior: Clip.none,
            children: [
              Image.network(
                'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                //이미지를 설정된 색으로 블렌딩처리
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
              Positioned(
                  bottom: -48,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                            'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg')),
                  ))
            ],
          ),
          SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(fontSize: 32),
                ),
                Divider(),
                Row(children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    profile.phone,
                    style: TextStyle(fontSize: 14),
                  )
                ]),
                Text(
                  profile.website,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  profile.address.street,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
