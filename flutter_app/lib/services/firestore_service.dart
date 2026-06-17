import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/word_model.dart';

class FirestoreService {
  final _collection = FirebaseFirestore.instance.collection('vocabulary');

  Future<void> saveWord(WordModel word) async {
    await _collection.add(word.toFirestore());
  }

  Stream<List<WordModel>> getWords() {
    return _collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return WordModel.fromJson(doc.data());
      }).toList();
    });
  }
}
