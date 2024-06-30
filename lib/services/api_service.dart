import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:multicines_plaza/models/movie.dart';

class ApiService{
  final String _baseUrl = dotenv.env['API_BACK']?? '';
  Future peliculas() async {
    final response = await http.get(Uri.parse('$_baseUrl/peliculas'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((movie) => _processMovie(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Future proximos() async {
    final response = await http.get(Uri.parse('$_baseUrl/proximos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((movie) => _processMovie(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Movie _processMovie(Map<String, dynamic> movie) {
    movie['backdrop_path'] = _processImagePath(movie['backdrop_path']);
    movie['poster_path'] = _processImagePath(movie['poster_path']);
    movie['origin_country'] = List<String>.from(movie['origin_country'] ?? []);
    movie['belongs_to_collection'] = movie['belongs_to_collection']?.toString() ?? '';
    movie['vote_average'] = (movie['vote_average'] as num).toDouble();

    return Movie.fromJson(movie);
  }

  String _processImagePath(String? path) {
    if (path == null || path.contains('http')) {
      return path ?? '';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$path';
    }
  }
}