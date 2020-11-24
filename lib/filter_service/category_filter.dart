import 'dart:convert';
import 'package:cine_flix/datas/category_data.dart';
import 'package:http/http.dart' as http;

class ServicesCat {
  static const String url = 'https://cine-flix.herokuapp.com/categories';

  static Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Category> list = parseCategories(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Category> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }
}
