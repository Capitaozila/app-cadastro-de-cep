// viacep_api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCepApi {
  static Future<Map<String, dynamic>?> fetchCep(String cep) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      return null;
    }
  }
}
