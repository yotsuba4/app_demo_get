import 'dart:async';
import 'package:app_demo_get/models/find-all-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:dio/dio.dart';

class ApiFindFood {
  static Future<List<Foods>> fetchFoods(String key) async {
    final response = await Dio().get(
        'https://kltn-foodoffer.herokuapp.com/api/cus/findProducts?key=$key');
    var test = FindFood.fromJson(response.data);
    return test.data.food;
  }
}
