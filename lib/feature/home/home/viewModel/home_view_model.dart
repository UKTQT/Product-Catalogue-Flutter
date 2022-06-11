import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/home/home/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = HomeService();

  HomeViewModel() {
    fetchAllProducts();
  }
  //Product get
  List<Products>? productItems = [];

  Future<List<Products>?> fetchAllProducts() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    productItems = await _homeService.fetchAllProducts(token: token);
    notifyListeners();
  }
}
