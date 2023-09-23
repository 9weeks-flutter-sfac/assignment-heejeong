// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SlideThree extends StatelessWidget {
  const SlideThree({Key? key, required this.first, required this.second, required this.third,}) : super(key: key);
  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 58,
              color: Colors.white,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: double.infinity,
                  width: (MediaQuery.of(context).size.width)/3,
                  padding: EdgeInsets.fromLTRB(0,0,1,1),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(first, style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.black54
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: (MediaQuery.of(context).size.width)/3,
                  padding: EdgeInsets.fromLTRB(0,0,1,1),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(second, style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.black54
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: (MediaQuery.of(context).size.width)/3,
                  padding: EdgeInsets.only(bottom: 1),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(third, style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.black54
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
              ],
            ));
  }
}
