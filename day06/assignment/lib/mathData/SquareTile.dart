// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({Key? key, required this.num,}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 10,  
                    width: 10,  
                    child: Text(num.toString()),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
                );
  }
}
