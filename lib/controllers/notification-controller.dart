import 'package:app_demo_get/apimodule/notification/api-get-notification.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:get/get.dart';

import 'package:app_demo_get/models/get-noti.dart';

class NotificationController extends GetxController {
  RxList<NotificationsList> listNoti = <NotificationsList>[].obs;
  RxBool loadNoti = true.obs;
  void fetchNoti() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      loadNoti.value = true;
      var data = await ApiGetNotification.getNotification(token);
      print(data.notificationsList.length);
      listNoti.assignAll(data.notificationsList);
      formatString(listNoti[0].message);
    } finally {
      loadNoti.value = false;
    }
  }

  formatString(String message) {
    var chuoi = message.split(' ');
    print(chuoi[2]);
    return chuoi[2];
  }
}
