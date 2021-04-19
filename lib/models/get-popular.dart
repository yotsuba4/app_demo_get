import 'package:app_demo_get/models/object/food-object.dart';

class ApiPopular {
  String status;
  Data data;

  ApiPopular({this.status, this.data});

  ApiPopular.fromJson(Map<String, dynamic> json) {
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
  List<Food> food;

  Data({this.food});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['food'] != null) {
      food = <Food>[];
      json['food'].forEach((v) {
        food.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.food != null) {
      data['food'] = this.food.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



