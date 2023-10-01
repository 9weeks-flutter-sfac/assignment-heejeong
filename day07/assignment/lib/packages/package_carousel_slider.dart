// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class packageCarouselSlider extends StatefulWidget {
  const packageCarouselSlider({
    Key? key,
  }) : super(key: key);
  //매개변수 안받아짐. why??
  // final List<String> imgUrl;

  @override
  State<packageCarouselSlider> createState() => _packageCarouselSliderState();
}

class _packageCarouselSliderState extends State<packageCarouselSlider> {
  final imageUrl = [
  "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('7일차 과제 2번'),
      ),

      body: Center(
        // child: Container(
        //   height: 250,
          child: CarouselSlider.builder(
            itemCount: imageUrl.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Container(
                margin: EdgeInsets.all(8),
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl[itemIndex]),
                    fit: BoxFit.cover, // 이미지를 컨테이너에 맞게 자동 조절
                  ),
                  borderRadius: BorderRadius.circular(16.0), // 원하는 모양으로 경계선 설정
                ),
              ),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(microseconds: 2500),
              viewportFraction: 0.8,
            ),
          ),
      ));
  }
}