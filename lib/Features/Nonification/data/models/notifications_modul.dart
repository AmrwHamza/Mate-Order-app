class NotificationsModul {
  List<NOtification>? notifications;

  NotificationsModul({this.notifications});

  NotificationsModul.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      notifications = <NOtification>[];
      json['data'].forEach((v) {
        notifications!.add(NOtification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (notifications != null) {
      data['data'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NOtification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  NotficationMessage? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NOtification(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  NOtification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? NotficationMessage.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class NotficationMessage {
  String? message;

  NotficationMessage({this.message});

  NotficationMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}
