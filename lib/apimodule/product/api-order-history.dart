import 'package:app_demo_get/models/order-history.dart';
import 'package:dio/dio.dart';

class ApiOrderHistory {
  static Future<List<HisTran>> getHistory(String token) async {
    final response = await Dio().get(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/transecsion',
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    var map = OrderHistory.fromJson(response.data);
    return map.data.hisTran;
  }
}
