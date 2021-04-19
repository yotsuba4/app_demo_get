import 'dart:async';
import 'dart:convert';
import 'package:app_demo_get/models/find-all-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:http/http.dart' as http;

class ApiFindFood {
  static Future<List<Food>> fetchFoods(String key) async {
    print(key);
    final url = Uri.https(
        'khtnfoodoffer.herokuapp.com', 'api/cus/findProducts', {'key': key});
    final response = await http.get(url);
    print('Day la ket qua tim kiem $response');
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      var test = FindFood.fromJson(map);
      return test.data.food;
    } else {
      throw Exception('Failed to find');
    }
  }
}
