abstract class VocabularyEvent {}

class LoadWordsEvent extends VocabularyEvent {}

class SaveWordEvent extends VocabularyEvent {
  final String word;
  final String meaning;
  final String translation;

  SaveWordEvent({
    required this.word,
    required this.meaning,
    required this.translation,
  });
}
