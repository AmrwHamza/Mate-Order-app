class RegisterUserModel {
  User? user;
  String? token;

  RegisterUserModel({this.user, this.token});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    token = json['token'] as String;
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? email;
  int? id;

  User(
      {this.firstName,
      this.lastName,
      this.phone,
      this.password,
      this.email,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    password = json['password'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['password'] = password;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
