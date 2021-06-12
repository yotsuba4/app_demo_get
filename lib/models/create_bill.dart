import 'package:app_demo_get/models/object/bill.dart';
import 'package:app_demo_get/models/object/food-object.dart';

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
  List<GetBillDetail> getBillDetail;

  Data({this.getBillDetail});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['get_bill_detail'] != null) {
      getBillDetail = <GetBillDetail>[];
      json['get_bill_detail'].forEach((v) {
        getBillDetail.add(new GetBillDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getBillDetail != null) {
      data['get_bill_detail'] =
          this.getBillDetail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetBillDetail {
  String sId;
  Foods food;
  int amount;
  Bill bill;
  int iV;

  GetBillDetail({this.sId, this.food, this.amount, this.bill, this.iV});

  GetBillDetail.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    food = json['food'] != null ? new Foods.fromJson(json['food']) : null;
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
