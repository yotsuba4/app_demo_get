import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:dio/dio.dart';

class ApiEditAccount {
  static Future<bool> uploadAvatar(String filePath) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);

    FormData formData = new FormData.fromMap(
        {"avatar": await MultipartFile.fromFile(filePath)});

    Response response = await Dio()
        .post('https://kltn-foodoffer.herokuapp.com/api/user/auth/editAccount',
            data: formData,
            options: Options(headers: {
              'authorization': token,
            }));
    if (response.data['status'] == 'success')
      return true;
    else
      return false;
  }
}
