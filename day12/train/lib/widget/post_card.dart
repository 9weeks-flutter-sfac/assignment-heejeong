// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:train/model/post.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          launchUrlString(post.postUrl);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.symbolImg),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  post.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(DateFormat.MMMEd().format(post.createdAt)),
              ],
            ),
          ),
        ));
  }
}
