import 'package:app_demo_get/models/get-new-foods.dart';
import 'package:app_demo_get/models/object/food-object.dart';

import 'package:dio/dio.dart';

class ApiNewFoods {
  static Future<List<Foods>> fetchNewFoods() async {
    final response = await Dio()
        .get('https://kltn-foodoffer.herokuapp.com/api/cus/getNewFood');
    Map<String, dynamic> map = response.data;
    var result = ApiNewFood.fromJson(map);
    return result.data.foods;
  }
}
