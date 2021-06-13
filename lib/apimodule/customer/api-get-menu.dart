import 'package:app_demo_get/models/get-menu.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:dio/dio.dart';

class ApiGetMenu {
  static Future<List<Foods>> getMenu(String resID) async {
    final response = await Dio().get(
        'https://kltn-foodoffer.herokuapp.com/api/cus/getResMenu?res_id=$resID');
    var test = GetMenu.fromJson(response.data);
    return test.data.food;
  }
}
