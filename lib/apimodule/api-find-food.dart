import 'dart:async';
import 'package:app_demo_get/models/find-all-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:dio/dio.dart';

class ApiFindFood {
  static Future<List<Food>> fetchFoods(String key) async {
    final response = await Dio().get(
        'https://khtnfoodoffer.herokuapp.com/api/cus/findProducts?key=$key');
    print(response.data);
    var test = FindFood.fromJson(response.data);
    print(test.status);
    return test.data.food;
  }
}
