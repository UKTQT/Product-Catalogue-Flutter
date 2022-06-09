class LoginModel {
  String? password;
  String? email;

  LoginModel({this.password, this.email});

  LoginModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
