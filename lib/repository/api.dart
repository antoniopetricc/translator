import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translator/models/translate.dart';

class Api {
  static const String _baseUrl = "https://libretranslate.pussthecat.org";
  final http.Client client = http.Client();

  Future<Translate> translate({
    required String text,
    required String from,
    required String to,
  }) async {
    final url = Uri.parse(
        "$_baseUrl/translate?q=$text&source=$from&target=$to&format=text");
    try {
      final response = await client.post(url);
      if (response.statusCode == 200) {
        return Translate.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
