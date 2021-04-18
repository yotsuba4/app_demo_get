import 'dart:async';
import 'dart:convert';
import 'package:app_demo_get/productmodule/models/get-popular.dart';
import 'package:http/http.dart' as http;

class ApiPopuLarFood {
  static Future<List<Food>> fetchPopularFoods() async {
    var url = Uri.https('khtnfoodoffer.herokuapp.com', 'api/cus/topRate');
    var response = await http.get(url);
    print(response.body);
    Map<String, dynamic> map = jsonDecode(response.body);
    print(map['status']);
    var result = ApiPopular.fromJson(map);
    print(result.status);
    print(result.data);

    return result.data.food;
  }
}
