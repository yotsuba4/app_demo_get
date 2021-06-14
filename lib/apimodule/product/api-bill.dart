import 'package:app_demo_get/models/create_bill.dart';
import 'package:dio/dio.dart';

class ApiBill {
  static Future<List<GetBillDetail>> createBill(
    String resID,
    bool payMethod,
    String code,
    List<String> foodIDs,
    List<String> amounts,
    String token,
  ) async {
    final response = await Dio().post(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/order',
      data: {
        "restaurant": resID,
        "payment": payMethod,
        "code": code,
        "food": foodIDs,
        "amount": amounts
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    print('Day la response createBill $response');
    var map = CreateBill.fromJson(response.data);

    return map.data.getBillDetail;
  }

  static Future<bool> deleteBill(String billID, String token) async {
    final response = await Dio().post(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/delBillById?bill_id=$billID',
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'authorization': token,
      }),
    );
    if (response.data['status'] == 'success') {
      return true;
    }
    return false;
  }
}
