class Bill {
  String status;
  bool payment;
  String discountCode;
  String dateCreate;
  int total;
  String message;
  int sort;
  String sId;
  String restaurant;
  String user;
  int iV;

  Bill(
      {this.status,
      this.payment,
      this.discountCode,
      this.dateCreate,
      this.total,
      this.message,
      this.sort,
      this.sId,
      this.restaurant,
      this.user,
      this.iV});

  Bill.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payment = json['payment'];
    discountCode = json['discount_code'];
    dateCreate = json['dateCreate'];
    total = json['total'];
    message = json['message'];
    sort = json['sort'];
    sId = json['_id'];
    restaurant = json['restaurant'];
    user = json['user'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['payment'] = this.payment;
    data['discount_code'] = this.discountCode;
    data['dateCreate'] = this.dateCreate;
    data['total'] = this.total;
    data['message'] = this.message;
    data['sort'] = this.sort;
    data['_id'] = this.sId;
    data['restaurant'] = this.restaurant;
    data['user'] = this.user;
    data['__v'] = this.iV;
    return data;
  }
}
