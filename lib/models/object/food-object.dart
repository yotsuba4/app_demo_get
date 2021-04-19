import 'package:app_demo_get/models/object/restaurant-obj.dart';

class Food {
  String image;
  num rate;
  String dateCreate;
  String sId;
  String foodName;
  Restaurant restaurant;
  num price;
  String caption;
  num iV;

  Food(
      {this.image,
      this.rate,
      this.dateCreate,
      this.sId,
      this.foodName,
      this.restaurant,
      this.price,
      this.caption,
      this.iV});

  Food.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    rate = json['rate'];
    dateCreate = json['dateCreate'];
    sId = json['_id'];
    foodName = json['foodName'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    price = json['price'];
    caption = json['caption'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['dateCreate'] = this.dateCreate;
    data['_id'] = this.sId;
    data['foodName'] = this.foodName;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    data['price'] = this.price;
    data['caption'] = this.caption;
    data['__v'] = this.iV;
    return data;
  }
}
