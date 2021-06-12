import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  static MainPageController instance = Get.find();
  RxInt currentIndex = 0.obs;
  String token = '';
  void getToken() async {
    token = await SPref.get(SPrefCache.KEY_TOKEN);
    print('token hien tai la: $token');
  }
}
