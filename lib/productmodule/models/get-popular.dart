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
      food = new List<Food>();
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

class Restaurant {
  bool isVerified;
  String dateGeneral;
  String banner;
  String sId;
  String restaurantName;
  String email;
  String password;
  String phone;
  String adress;
  String type;
  num iV;

  Restaurant(
      {this.isVerified,
      this.dateGeneral,
      this.banner,
      this.sId,
      this.restaurantName,
      this.email,
      this.password,
      this.phone,
      this.adress,
      this.type,
      this.iV});

  Restaurant.fromJson(Map<String, dynamic> json) {
    isVerified = json['isVerified'];
    dateGeneral = json['dateGeneral'];
    banner = json['banner'];
    sId = json['_id'];
    restaurantName = json['restaurantName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    adress = json['adress'];
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isVerified'] = this.isVerified;
    data['dateGeneral'] = this.dateGeneral;
    data['banner'] = this.banner;
    data['_id'] = this.sId;
    data['restaurantName'] = this.restaurantName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['adress'] = this.adress;
    data['type'] = this.type;
    data['__v'] = this.iV;
    return data;
  }
}
