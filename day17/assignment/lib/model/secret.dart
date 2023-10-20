import 'dart:convert';

class Secret {
  String? authorName;
  String id;
  String? secret;
  String? author;

  Secret({required this.id, this.authorName, this.secret, this.author});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authorName': authorName,
      'secret': secret,
      'author': author,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'] as String,
      authorName: map['authorName'] as String,
      secret: map['secret'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}
