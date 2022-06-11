import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/init/cache/cache.dart';
import 'package:product_catalogue_flutter/feature/home/home/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/base/viewModel/base_view_model.dart';
import '../model/product_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
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
    return null;
  }

  // --------- Product like

  postProductLike({required int? productId}) async {
    if (!cache.preferences!.containsKey(productId.toString())) {
      cache.preferences!.setBool(productId.toString(), true);
    } else {
      bool? productStatus = cache.preferences!.getBool(productId.toString());
      cache.preferences!.setBool(productId.toString(), !productStatus!);
      print(cache.preferences!.getBool(productId.toString()));
    }
    notifyListeners();
  }

  // Gelen veride ürünün favoriye eklenip eklenmediği gelmediği için iptal edildi

  /* ProductLikeModel? productLikeStatus;

  Future postProductLike({int? productId}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    productLikeStatus =
        await _homeService.postProductLike(token: token, productId: productId);

    notifyListeners();
  } */
}
