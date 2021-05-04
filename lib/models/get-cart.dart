/* import 'package:app_demo_get/models/object/food-object.dart';

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
  num cartAmount;

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
  num amount;
  num iV;

  Cart({this.sId, this.user, this.food, this.amount, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    food = json['food'] != null ? new Foods.fromJson(json['food']) : null;
    amount = json['amount'];
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
    data['__v'] = this.iV;
    return data;
  }
}
 */

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
      cart = new List<Cart>();
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
  Food food;
  int amount;
  int iV;

  Cart({this.sId, this.user, this.food, this.amount, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    food = json['food'] != null ? new Food.fromJson(json['food']) : null;
    amount = json['amount'];
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
    data['__v'] = this.iV;
    return data;
  }
}

class Food {
  String image;
  int buys;
  int rate;
  String dateCreate;
  String sId;
  String foodName;
  int price;
  String caption;
  String restaurant;
  int iV;

  Food(
      {this.image,
      this.buys,
      this.rate,
      this.dateCreate,
      this.sId,
      this.foodName,
      this.price,
      this.caption,
      this.restaurant,
      this.iV});

  Food.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    buys = json['buys'];
    rate = json['rate'];
    dateCreate = json['dateCreate'];
    sId = json['_id'];
    foodName = json['foodName'];
    price = json['price'];
    caption = json['caption'];
    restaurant = json['restaurant'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['buys'] = this.buys;
    data['rate'] = this.rate;
    data['dateCreate'] = this.dateCreate;
    data['_id'] = this.sId;
    data['foodName'] = this.foodName;
    data['price'] = this.price;
    data['caption'] = this.caption;
    data['restaurant'] = this.restaurant;
    data['__v'] = this.iV;
    return data;
  }
}
