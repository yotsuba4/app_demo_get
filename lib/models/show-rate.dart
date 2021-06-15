import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:app_demo_get/models/object/user.dart';

class ShowRate {
  String status;
  Data data;

  ShowRate({this.status, this.data});

  ShowRate.fromJson(Map<String, dynamic> json) {
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
  Rate rate;
  List<ListRate> listRate;
  int total;
  int pageTotal;

  Data({this.rate, this.listRate, this.total, this.pageTotal});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    if (json['list_rate'] != null) {
      listRate = <ListRate>[];
      json['list_rate'].forEach((v) {
        listRate.add(new ListRate.fromJson(v));
      });
    }
    total = json['total'];
    pageTotal = json['pageTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rate != null) {
      data['rate'] = this.rate.toJson();
    }
    if (this.listRate != null) {
      data['list_rate'] = this.listRate.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['pageTotal'] = this.pageTotal;
    return data;
  }
}

/* class Rate {
  double avg;
  int total;
  int percentVote1;
  int percentVote2;
  int percentVote3;
  double percentVote4;
  double percentVote5;

  Rate(
      {this.avg,
      this.total,
      this.percentVote1,
      this.percentVote2,
      this.percentVote3,
      this.percentVote4,
      this.percentVote5});

  Rate.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
    total = json['total'];
    percentVote1 = json['percent_vote_1'];
    percentVote2 = json['percent_vote_2'];
    percentVote3 = json['percent_vote_3'];
    percentVote4 = json['percent_vote_4'];
    percentVote5 = json['percent_vote_5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['total'] = this.total;
    data['percent_vote_1'] = this.percentVote1;
    data['percent_vote_2'] = this.percentVote2;
    data['percent_vote_3'] = this.percentVote3;
    data['percent_vote_4'] = this.percentVote4;
    data['percent_vote_5'] = this.percentVote5;
    return data;
  }
} */

class ListRate {
  String dateCreate;
  String sId;
  int rate;
  String food;
  User user;
  int iV;

  ListRate(
      {this.dateCreate, this.sId, this.rate, this.food, this.user, this.iV});

  ListRate.fromJson(Map<String, dynamic> json) {
    dateCreate = json['dateCreate'];
    sId = json['_id'];
    rate = json['rate'];
    food = json['food'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateCreate'] = this.dateCreate;
    data['_id'] = this.sId;
    data['rate'] = this.rate;
    data['food'] = this.food;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
