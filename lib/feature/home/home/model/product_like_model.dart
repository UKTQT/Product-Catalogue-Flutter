class ProductLikeModel {
  String? status;

  ProductLikeModel({this.status});

  ProductLikeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
