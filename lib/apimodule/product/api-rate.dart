import 'package:dio/dio.dart';

class ApiRate {
  static Future<bool> postRate(String foodID, String token, int rate) async {
    final response = await Dio().post(
      'http://kltn-foodoffer.herokuapp.com/api/user/func/rate',
      data: {"foodID": foodID, "rate": rate},
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    if (response.data['status'] == 'success') return true;
    return false;
  }

  static Future<bool> postComment(
      String foodID, String token, String comment) async {
    final response = await Dio().post(
      'http://kltn-foodoffer.herokuapp.com/api/user/func/comment',
      data: {
        "foodID": foodID,
        "comment": comment,
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    if (response.data['status'] == 'success') return true;
    return false;
  }
  /*  static Future<bool> updateRate(String foodID, String token, int rate) async {
    final response = await Dio().post(
      'http://kltn-foodoffer.herokuapp.com/api/user/func/editRate',
      data: {"foodID": foodID, "rate": rate},
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    if (response.data['status'] == 'success') return true;
    return false;
  } */
}
