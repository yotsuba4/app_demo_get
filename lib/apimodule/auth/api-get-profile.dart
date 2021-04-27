import 'package:app_demo_get/models/get-profile.dart';
import 'package:app_demo_get/models/object/user.dart';
import 'package:dio/dio.dart';

class ApiGetProfile {
  static Future<User> fetchProfile(String token) async {
    final response = await Dio().get(
      'https://kltn-foodoffer.herokuapp.com/api/user/auth/userProfile',
      options: Options(headers: {'authorization': token}),
    );
    var get = GetProfile.fromJson(response.data);
    return get.user;
  }
}
