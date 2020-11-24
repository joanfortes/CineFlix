import 'dart:convert';
import 'package:cine_flix/datas/movie_data.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = 'https://cine-flix.herokuapp.com/movies';

  static Future<List<Movies>> getMovies() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Movies> list = parseMovies(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Movies> parseMovies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Movies>((json) => Movies.fromJson(json)).toList();
  }
}
