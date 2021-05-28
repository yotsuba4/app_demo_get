import 'package:app_demo_get/models/object/bill.dart';

class CreateBill {
  String status;
  Data data;

  CreateBill({this.status, this.data});

  CreateBill.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Bill bill;

  Data({this.bill});

  Data.fromJson(Map<String, dynamic> json) {
    bill = json['bill'] != null ? new Bill.fromJson(json['bill']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bill != null) {
      data['bill'] = this.bill.toJson();
    }
    return data;
  }
}
