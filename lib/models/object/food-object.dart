import 'package:app_demo_get/models/object/restaurant-obj.dart';

class Foods {
  String image;
  num buys;
  num rate;
  String dateCreate;
  String sId;
  String foodName;
  num price;
  String caption;
  Restaurant restaurant;
  num iV;

  Foods(
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

  Foods.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    buys = json['buys'];
    rate = json['rate'];
    dateCreate = json['dateCreate'];
    sId = json['_id'];
    foodName = json['foodName'];
    price = json['price'];
    caption = json['caption'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
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
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
