import 'package:app_demo_get/models/object/user.dart';

class GetProfile {
  String status;
  User user;

  GetProfile({this.status, this.user});

  GetProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['data'] = this.user.toJson();
    }
    return data;
  }
}

/* class Data {
  String avatar;
  bool isVerified;
  bool isLock;
  String sId;
  String username;
  String email;
  String password;
  String phone;
  String address;
  String fullName;
  bool gender;
  String iD;
  String bDate;
  String date;
  num iV;

  Data(
      {this.avatar,
      this.isVerified,
      this.isLock,
      this.sId,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.fullName,
      this.gender,
      this.iD,
      this.bDate,
      this.date,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    isVerified = json['isVerified'];
    isLock = json['isLock'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    fullName = json['fullName'];
    gender = json['gender'];
    iD = json['ID'];
    bDate = json['bDate'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['isVerified'] = this.isVerified;
    data['isLock'] = this.isLock;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['ID'] = this.iD;
    data['bDate'] = this.bDate;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
 */
