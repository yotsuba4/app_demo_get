import 'dart:async';
import 'package:app_demo_get/models/get-popular.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:dio/dio.dart';

class ApiPopuLarFood {
  static Future<List<Food>> fetchPopularFoods() async {
    final response =
        await Dio().get('https://khtnfoodoffer.herokuapp.com/api/cus/topRate');
    Map<String, dynamic> map = response.data;
    var result = ApiPopular.fromJson(map);
    return result.data.food;
  }
}
