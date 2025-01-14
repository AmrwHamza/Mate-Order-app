class DeleteOrderModel {
  String? message;

  DeleteOrderModel({this.message});

  DeleteOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}
