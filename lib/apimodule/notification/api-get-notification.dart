import 'package:app_demo_get/models/get-noti.dart';
import 'package:dio/dio.dart';

class ApiGetNotification {
  static Future<Data> getNotification(String token) async {
    final response = await Dio().get(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/notifications',
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    print(response);
    var map = GetNotification.fromJson(response.data);
    return map.data;
  }
}
