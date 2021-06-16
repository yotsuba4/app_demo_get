import 'package:app_demo_get/models/object/restaurant-obj.dart';

class OrderHistory {
  String status;
  Data data;

  OrderHistory({this.status, this.data});

  OrderHistory.fromJson(Map<String, dynamic> json) {
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
  List<HisTran> hisTran;

  Data({this.hisTran});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['hisTran'] != null) {
      hisTran = new List<HisTran>();
      json['hisTran'].forEach((v) {
        hisTran.add(new HisTran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hisTran != null) {
      data['hisTran'] = this.hisTran.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HisTran {
  String status;
  bool payment;
  String discountCode;
  String dateCreate;
  int total;
  String message;
  int sort;
  String sId;
  Restaurant restaurant;
  String user;
  int iV;

  HisTran(
      {this.status,
      this.payment,
      this.discountCode,
      this.dateCreate,
      this.total,
      this.message,
      this.sort,
      this.sId,
      this.restaurant,
      this.user,
      this.iV});

  HisTran.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payment = json['payment'];
    discountCode = json['discount_code'];
    dateCreate = json['dateCreate'];
    total = json['total'];
    message = json['message'];
    sort = json['sort'];
    sId = json['_id'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJsonGetAllRes(json['restaurant'])
        : null;
    user = json['user'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['payment'] = this.payment;
    data['discount_code'] = this.discountCode;
    data['dateCreate'] = this.dateCreate;
    data['total'] = this.total;
    data['message'] = this.message;
    data['sort'] = this.sort;
    data['_id'] = this.sId;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    data['user'] = this.user;
    data['__v'] = this.iV;
    return data;
  }
}
