import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/home/home/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = HomeService();

  //Product get
  ProductModel? productItems;

  Future<ProductModel?>? fetchAllProducts() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    productItems = await _homeService.fetchAllProducts(token: token);
  }
}
