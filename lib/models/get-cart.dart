import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';

class GetCart {
  String status;
  Data data;

  GetCart({this.status, this.data});

  GetCart.fromJson(Map<String, dynamic> json) {
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
  List<Cart> cart;
  int cartAmount;

  Data({this.cart, this.cartAmount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart.add(new Cart.fromJson(v));
      });
    }
    cartAmount = json['cartAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    data['cartAmount'] = this.cartAmount;
    return data;
  }
}

class Cart {
  String sId;
  String user;
  Foods food;
  int amount;
  Restaurant restaurant;
  int iV;

  Cart({this.sId, this.user, this.food, this.amount, this.restaurant, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    food = json['food'] != null ? new Foods.fromJsonCart(json['food']) : null;
    amount = json['amount'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.food != null) {
      data['food'] = this.food.toJson();
    }
    data['amount'] = this.amount;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
