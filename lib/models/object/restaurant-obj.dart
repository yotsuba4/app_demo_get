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
