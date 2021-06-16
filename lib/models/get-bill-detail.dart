import 'package:app_demo_get/models/object/bill.dart';
import 'package:app_demo_get/models/object/food-object.dart';

class GetBillItem {
  String status;
  Data data;

  GetBillItem({this.status, this.data});

  GetBillItem.fromJson(Map<String, dynamic> json) {
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
  List<BillDetail> billDetail;

  Data({this.billDetail});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bill_detail'] != null) {
      billDetail = <BillDetail>[];
      json['bill_detail'].forEach((v) {
        billDetail.add(new BillDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billDetail != null) {
      data['bill_detail'] = this.billDetail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillDetail {
  String sId;
  Foods food;
  int amount;
  Bill bill;
  int iV;

  BillDetail({this.sId, this.food, this.amount, this.bill, this.iV});

  BillDetail.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    food = json['food'] != null ? new Foods.fromJsonBill(json['food']) : null;
    amount = json['amount'];
    bill = json['bill'] != null ? new Bill.fromJson(json['bill']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.food != null) {
      data['food'] = this.food.toJson();
    }
    data['amount'] = this.amount;
    if (this.bill != null) {
      data['bill'] = this.bill.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
