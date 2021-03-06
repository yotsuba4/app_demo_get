import 'package:app_demo_get/models/object/food-object.dart';

class FindFood {
  String status;
  Data data;

  FindFood({this.status, this.data});

  FindFood.fromJson(Map<String, dynamic> json) {
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
  List<Foods> food;
  int productsTotal;
  int pageTotal;

  Data({this.food, this.productsTotal, this.pageTotal});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['food'] != null) {
      food = [];
      json['food'].forEach((v) {
        food.add(new Foods.fromJson(v));
      });
    }
    productsTotal = json['productsTotal'];
    pageTotal = json['pageTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.food != null) {
      data['food'] = this.food.map((v) => v.toJson()).toList();
    }
    data['productsTotal'] = this.productsTotal;
    data['pageTotal'] = this.pageTotal;
    return data;
  }
}
