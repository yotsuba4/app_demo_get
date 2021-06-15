import 'package:app_demo_get/models/show-rate.dart';
import 'package:dio/dio.dart';

class ApiGetRate {
  static Future<Rate> fetchRates(String key) async {
    final response = await Dio().get(
        'https://kltn-foodoffer.herokuapp.com/api/cus/showRate?foodID=$key');
    ApiShowRate parse = ApiShowRate.fromJson(response.data);
    return parse.data.rate;
  }

  static Future<List<ListRate>> fetchListRates(String key) async {
    final response = await Dio().get(
        'https://kltn-foodoffer.herokuapp.com/api/cus/showRate?foodID=$key');
    var map = ShowRate.fromJson(response.data);
    return map.data.listRate;
  }

  static Future<List<ListRate>> fetchListReviews(String key) async {
    final response = await Dio().get(
        'https://kltn-foodoffer.herokuapp.com/api/cus/showComment?foodID=$key');
    var map = ShowRate.fromJson(response.data);
    return map.data.listRate;
  }
}

class ApiShowRate {
  String status;
  Data data;

  ApiShowRate({this.status, this.data});

  ApiShowRate.fromJson(Map<String, dynamic> json) {
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

  Data({this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rate != null) {
      data['rate'] = this.rate.toJson();
    }
    return data;
  }
}

class Rate {
  num avg;
  num total;
  num percentVote1;
  num percentVote2;
  num percentVote3;
  num percentVote4;
  num percentVote5;

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
    percentVote1 = json['percent_vote_1'] != null ? json['percent_vote_1'] : 0;
    percentVote2 = json['percent_vote_2'] != null ? json['percent_vote_2'] : 0;
    percentVote3 = json['percent_vote_3'] != null ? json['percent_vote_3'] : 0;
    percentVote4 = json['percent_vote_4'] != null ? json['percent_vote_4'] : 0;
    percentVote5 = json['percent_vote_5'] != null ? json['percent_vote_5'] : 0;
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
}
