class DeleteProductFromOrderModul {
  String? message;

  DeleteProductFromOrderModul({this.message});

  DeleteProductFromOrderModul.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}
