// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

/* class ProductModel {
  ProductModel({
    this.products,
  });

  final List<Product>? products;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products!.map((x) => x.toMap())),
      };
} */

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.timeStamp,
    this.likes,
  });

  final int? id;
  final String? name;
  final int? price;
  final String? image;
  final String? description;
  final DateTime? timeStamp;
  final List<Like>? likes;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        timeStamp: DateTime.parse(json["timeStamp"]),
        likes: List<Like>.from(json["likes"].map((x) => Like.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "timeStamp": timeStamp!.toIso8601String(),
        "likes": List<dynamic>.from(likes!.map((x) => x.toMap())),
      };
}

class Like {
  Like({
    this.id,
    this.email,
    this.password,
    this.name,
    this.token,
    this.timeStamp,
  });

  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final String? token;
  final int? timeStamp;

  factory Like.fromJson(String str) => Like.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Like.fromMap(Map<String, dynamic> json) => Like(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        token: json["token"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "token": token,
        "timeStamp": timeStamp,
      };
}
