import 'dart:async';
import 'dart:convert';
import 'package:app_demo_get/models/get-popular.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:http/http.dart' as http;

class ApiPopuLarFood {
  static Future<List<Food>> fetchPopularFoods() async {
    final url = Uri.https('khtnfoodoffer.herokuapp.com', 'api/cus/topRate');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      var result = ApiPopular.fromJson(map);
      return result.data.food;
    } else {
      throw Exception('Failed to load popular foods');
    }
  }
}
