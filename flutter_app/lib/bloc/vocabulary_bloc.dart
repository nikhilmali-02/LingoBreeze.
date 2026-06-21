import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/firestore_service.dart';
import '../services/api_service.dart';
import 'vocabulary_event.dart';
import 'vocabulary_state.dart';
import '../models/word_model.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final FirestoreService _firestoreService = FirestoreService();
  final ApiService _apiService = ApiService();

  VocabularyBloc() : super(VocabularyInitial()) {
    on<LoadWordsEvent>(_onLoadWords);
    on<FetchWordsFromApiEvent>(_onFetchWordsFromApi);
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

  void _onFetchWordsFromApi(
    FetchWordsFromApiEvent event,
    Emitter<VocabularyState> emit,
  ) async {
    print('FetchWordsFromApiEvent triggered');
    try {
      final apiWords = await _apiService.fetchWords();
      emit(ApiWordsLoaded(apiWords));
      print('ApiWordsLoaded emitted with ${apiWords.length} words');
    } catch (e) {
      print('API error: ${e.toString()}');
      emit(VocabularyError('Failed to fetch words from API: ${e.toString()}'));
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
