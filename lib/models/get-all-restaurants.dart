import 'package:app_demo_get/models/object/restaurant-obj.dart';

class GetAllRes {
  String status;
  Data data;

  GetAllRes({this.status, this.data});

  GetAllRes.fromJson(Map<String, dynamic> json) {
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
  List<Restaurant> restaurant;
  int amount;

  Data({this.restaurant, this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['restaurant'] != null) {
      restaurant = <Restaurant>[];
      json['restaurant'].forEach((v) {
        restaurant.add(new Restaurant.fromJsonGetAllRes(v));
      });
    }
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.map((v) => v.toJson()).toList();
    }
    data['amount'] = this.amount;
    return data;
  }
}
