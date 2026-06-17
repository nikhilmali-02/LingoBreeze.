import '../models/word_model.dart';

abstract class VocabularyState {}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoading extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  final List<WordModel> words;
  VocabularyLoaded(this.words);
}

class VocabularyError extends VocabularyState {
  final String message;
  VocabularyError(this.message);
}
