import 'package:app_demo_get/models/get-all-restaurants.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:dio/dio.dart';

class ApiRestaurant {
  static Future<List<Restaurant>> fetchAllRes() async {
    final response = await Dio()
        .get('https://kltn-foodoffer.herokuapp.com/api/cus/getAllRestaurant');
    var map = GetAllRes.fromJson(response.data);
    return map.data.restaurant;
  }
}
