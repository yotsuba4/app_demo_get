import 'package:app_demo_get/apimodule/customer/api-get-all-restaurants.dart';
import 'package:app_demo_get/apimodule/customer/api-get-menu.dart';
import 'package:app_demo_get/controllers/location-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class RestaurantCotroller extends GetxController {
  static RestaurantCotroller instance = Get.find();
  RxList<Foods> menu = <Foods>[].obs;
  RxList<Restaurant> listRes = <Restaurant>[].obs;
  RxBool loading = true.obs;
  RxBool loadingResList = true.obs;
  Position current;
  @override
  void onInit() {
    super.onInit();
    fetchAllRestaurans();
  }

  void getMenu(String resID) async {
    try {
      loading(true);
      var list = await ApiGetMenu.getMenu(resID);
      menu.assignAll(list);
    } finally {
      loading(false);
    }
  }

  void fetchAllRestaurans() async {
    current = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    try {
      loadingResList.value = true;
      var list = await ApiRestaurant.fetchAllRes();
      listRes.assignAll(list);
      print('so nha hang hien co:' + listRes.length.toString());
      print('khoang cach khi chua sap xep:');
      print(getDistance(listRes[0].x, listRes[0].y));
      print(getDistance(listRes[1].x, listRes[1].y));
      print(getDistance(listRes[2].x, listRes[2].y));
      sortByDistance();
    } finally {
      loadingResList.value = false;
    }
  }

  void sortByDistance() {
    listRes.sort(
        (a, b) => getDistance(a.x, a.y).compareTo((getDistance(b.x, b.y))));
    print('khoang cach sau khi sap xep:');
    print(getDistance(listRes[0].x, listRes[0].y));
    print(getDistance(listRes[1].x, listRes[1].y));
    print(getDistance(listRes[2].x, listRes[2].y));
    print(getDistance(listRes[3].x, listRes[3].y));
    print(getDistance(listRes[4].x, listRes[4].y));
  }

  double getDistance(double endLatitude, double endLongitude) {
    return Geolocator.distanceBetween(
        current.latitude, current.longitude, endLatitude, endLongitude);
  }
}
