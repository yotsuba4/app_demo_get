import 'package:app_demo_get/models/object/user.dart';

class ShowComment {
  String status;
  Data data;

  ShowComment({this.status, this.data});

  ShowComment.fromJson(Map<String, dynamic> json) {
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
  List<Comment> comment;
  int totalComent;
  int totalPage;

  Data({this.comment, this.totalComent, this.totalPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
    totalComent = json['totalComent'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    data['totalComent'] = this.totalComent;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class Comment {
  String dateCreate;
  String sId;
  String food;
  User user;
  String message;
  int iV;

  Comment(
      {this.dateCreate, this.sId, this.food, this.user, this.message, this.iV});

  Comment.fromJson(Map<String, dynamic> json) {
    dateCreate = json['dateCreate'];
    sId = json['_id'];
    food = json['food'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateCreate'] = this.dateCreate;
    data['_id'] = this.sId;
    data['food'] = this.food;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['message'] = this.message;
    data['__v'] = this.iV;
    return data;
  }
}
