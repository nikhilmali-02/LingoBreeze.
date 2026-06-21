import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.0.104:3000';

  Future<List<WordModel>> fetchWords() async {
    final response = await http.get(Uri.parse('$_baseUrl/words'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => WordModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch words');
    }
  }
}
