import 'package:app_demo_get/models/create_bill.dart';
import 'package:app_demo_get/models/object/bill.dart';
import 'package:dio/dio.dart';

class ApiBill {
  static Future<Bill> createBill(
      String restaurantID, String code, String token) async {
    final response = await Dio().post(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/createBill',
      data: {
        'restaurant': restaurantID,
        'code': code,
        'token': token,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var map = CreateBill.fromJson(response.data);
    return map.data.bill;
  }

  static Future<bool> deleteBill(String billID, String token) async {
    final response = await Dio().post(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/delBillById?bill_id=$billID',
      data: {
        'token': token,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    if (response.data['status'] == 'success') {
      return true;
    }
    return false;
  }

  static Future<bool> addToBill(
      List<Map<String, String>> carts, String token, String bill) async {
    final response = await Dio().post(
      'https://kltn-foodoffer.herokuapp.com/api/user/func/updateBill',
      data: {
       /*  {'food': '6098f0cb775f4a0015b3a383', 'amount': '5'},
        {'food': '6098f20a775f4a0015b3a38b', 'amount': '6'},
        'token': token, */
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print('Day la response addToBill $response');
    if (response.data['status'] == 'success') {
      return true;
    }
    return false;
  }
}
