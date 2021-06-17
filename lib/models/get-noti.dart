class GetNotification {
  String status;
  Data data;

  GetNotification({this.status, this.data});

  GetNotification.fromJson(Map<String, dynamic> json) {
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
  List<NotificationsList> notificationsList;
  int total;
  int notWatched;

  Data({this.notificationsList, this.total, this.notWatched});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['notifications_list'] != null) {
      notificationsList = <NotificationsList>[];
      json['notifications_list'].forEach((v) {
        notificationsList.add(new NotificationsList.fromJson(v));
      });
    }
    total = json['total'];
    notWatched = json['not_watched'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationsList != null) {
      data['notifications_list'] =
          this.notificationsList.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['not_watched'] = this.notWatched;
    return data;
  }
}

class NotificationsList {
  String dateCreate;
  int sort;
  bool isWatched;
  String sId;
  String object;
  String title;
  String message;
  int iV;

  NotificationsList(
      {this.dateCreate,
      this.sort,
      this.isWatched,
      this.sId,
      this.object,
      this.title,
      this.message,
      this.iV});

  NotificationsList.fromJson(Map<String, dynamic> json) {
    dateCreate = json['dateCreate'];
    sort = json['sort'];
    isWatched = json['isWatched'];
    sId = json['_id'];
    object = json['object'];
    title = json['title'];
    message = json['message'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateCreate'] = this.dateCreate;
    data['sort'] = this.sort;
    data['isWatched'] = this.isWatched;
    data['_id'] = this.sId;
    data['object'] = this.object;
    data['title'] = this.title;
    data['message'] = this.message;
    data['__v'] = this.iV;
    return data;
  }
}
