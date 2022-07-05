import 'package:flutter_dictionary/models/word_model.dart';
import 'package:flutter_dictionary/services/api_service.dart';
import 'package:http/http.dart';

class WordRepository {
  Future<List<Word>> getWordsFromDictionary(String query) async {
    try {
      Response response = await ApiService().getApiRequest('en/$query');

      if (response.statusCode == 200) {
        return wordFromJson(response.body);
      } else {
        return [];
      }
    } on Exception {
      rethrow;
    }
  }
}
