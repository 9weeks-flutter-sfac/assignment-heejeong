// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

class Document {
  String title;
  String content;
  String sec_level;
  String? attachment_url;

  Document({
    required this.title,
    required this.content,
    required this.sec_level,
    this.attachment_url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'sec_level': sec_level,
      'attachment_url': attachment_url,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      title: map['title'] as String,
      content: map['content'] as String,
      sec_level: map['sec_level'] as String,
      attachment_url:
          map['attachment_url'] != '' ? map['attachment_url'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Document.fromJson(String source) =>
      Document.fromMap(json.decode(source) as Map<String, dynamic>);
}
