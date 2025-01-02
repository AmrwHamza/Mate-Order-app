class RegisterUserModel {
  User? user;
  String? token;

  RegisterUserModel({this.user, this.token});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;

    token = json['token'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
