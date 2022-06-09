import 'dart:convert';

class RegisterModel {
  RegisterModel({
    this.token,
  });

  final String? token;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
