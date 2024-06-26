import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final String _baseUrl = dotenv.env['API_BACK']?? '';
  Future moviesGet() async {
    final response = await http.get(Uri.parse('$_baseUrl/movies'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}