class WordModel {
  final String word;
  final String meaning;
  final String translation;

  WordModel({
    required this.word,
    required this.meaning,
    required this.translation,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      translation: json['translation'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'word': word, 'meaning': meaning, 'translation': translation};
  }
}
