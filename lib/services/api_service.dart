import 'package:http/http.dart';

class ApiService {
  static const baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries';

  Future<Response> getApiRequest(String endpoint) async {
    Uri uri = Uri.parse('$baseUrl/$endpoint');
    try {
      return await get(uri);
    } on Exception {
      rethrow;
    }
  }
}
