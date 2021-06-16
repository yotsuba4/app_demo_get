import 'package:app_demo_get/apimodule/product/api-order-history.dart';
import 'package:app_demo_get/models/order-history.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  RxList<HisTran> listOrder = <HisTran>[].obs;
  RxList<HisTran> listProcessing = <HisTran>[].obs;
  RxList<HisTran> listConfirmed = <HisTran>[].obs;
  RxList<HisTran> listPaid = <HisTran>[].obs;
  RxList<HisTran> listCancelled = <HisTran>[].obs;
  RxBool loadHis = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchOrderHistory();
  }

  void fetchOrderHistory() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      loadHis.value = true;
      var list = await ApiOrderHistory.getHistory(token);
      listOrder.assignAll(list);
      //print(listOrder.length);
      fetchProcessing();
      fetchConfirmed();
      fetchPaid();
      fetchCancelled();
    } finally {
      loadHis.value = false;
    }
  }

  void fetchProcessing() {
    var list = listOrder.where((e) => e.status == 'đang xử lý');
    // print(list.length);
    listProcessing.assignAll(list);
  }

  void fetchConfirmed() {
    var list = listOrder.where((e) => e.status == 'đã xác nhận');
    // print(list.length);
    listConfirmed.assignAll(list);
  }

  void fetchPaid() {
    var list = listOrder.where((e) => e.status == 'đã thanh toán');
    // print(list.length);
    listPaid.assignAll(list);
  }

  void fetchCancelled() {
    var list =
        listOrder.where((e) => e.status == 'đã hủy' || e.status == 'Đã hủy');
    // print(list.length);
    listCancelled.assignAll(list);
  }

  void cancelBill(String billID) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    var check = await ApiOrderHistory.cancelBill(token, billID);
    if (check) {
      Get.back();
      Get.snackbar('Thông báo', 'Hủy thành công');
      fetchOrderHistory();
    } else {
      Get.snackbar('Thông báo', 'Hủy thất bại');
    }
  }
}
