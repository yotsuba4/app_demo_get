import 'package:app_demo_get/models/object/food-object.dart';

class AllFood {
  String status;
  Data data;

  AllFood({this.status, this.data});

  AllFood.fromJson(Map<String, dynamic> json) {
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
  List<Foods> foods;
  int foodsAmount;

  Data({this.foods, this.foodsAmount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods.add(new Foods.fromJson(v));
      });
    }
    foodsAmount = json['foods_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    data['foods_amount'] = this.foodsAmount;
    return data;
  }
}
