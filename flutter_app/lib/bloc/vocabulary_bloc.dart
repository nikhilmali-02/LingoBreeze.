import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/firestore_service.dart';
import 'vocabulary_event.dart';
import 'vocabulary_state.dart';
import '../models/word_model.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final FirestoreService _firestoreService = FirestoreService();

  VocabularyBloc() : super(VocabularyInitial()) {
    on<LoadWordsEvent>(_onLoadWords);
    on<SaveWordEvent>(_onSaveWord);
  }

  void _onLoadWords(LoadWordsEvent event, Emitter<VocabularyState> emit) async {
    emit(VocabularyLoading());
    try {
      await emit.forEach(
        _firestoreService.getWords(),
        onData: (List<WordModel> words) => VocabularyLoaded(words),
        onError: (_, __) => VocabularyError('Failed to load words'),
      );
    } catch (e) {
      emit(VocabularyError(e.toString()));
    }
  }

  void _onSaveWord(SaveWordEvent event, Emitter<VocabularyState> emit) async {
    try {
      final word = WordModel(
        word: event.word,
        meaning: event.meaning,
        translation: event.translation,
      );
      await _firestoreService.saveWord(word);
    } catch (e) {
      emit(VocabularyError(e.toString()));
    }
  }
}
