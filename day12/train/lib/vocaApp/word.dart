class Word {
  String word;
  String meaning;
  String example;

  //기본 생성자
  Word({required this.word, required this.meaning, required this.example});

  //이름있는 생성자
  Word.fromMap(Map<String, dynamic> map)
      : word = map['word'],
        meaning = map['meaning'],
        example = map['example'];

  @override
  String toString() => 'Word($word / $meaning / $example)';

  @override
  operator ==(Object other) => other is Word && word == other.word;

  Map<String, dynamic> toMap() =>
      {'word': word, 'meaning': meaning, 'example': example};
}

void main() {
  Map<String, dynamic> networkData = {
    "word": "apple",
    "meaning": "사과",
    "example": "I want to eat an apple"
  };

  //데이터 받음
  var word = Word.fromMap(networkData);
  print(word.toMap());
}
