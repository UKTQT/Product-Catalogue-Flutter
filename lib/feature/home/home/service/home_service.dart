import 'dart:io';
import 'package:dio/dio.dart';
import 'package:product_catalogue_flutter/feature/home/home/model/product_like_model.dart';

import '../model/product_model.dart';

enum HomeServiceEnum { all, like }

abstract class IHomeService {
  Future<List<Products>?> fetchAllProducts({required String token});
}

class HomeService extends IHomeService {
  late final Dio _dio;

  HomeService() {
    _dio = Dio(
      BaseOptions(
          baseUrl: 'https://assignment-api.piton.com.tr/api/v1/product/'),
    );
  }

  @override
  Future<List<Products>?> fetchAllProducts({String? token}) async {
    try {
      final response = await _dio.get(
        HomeServiceEnum.all.name,
        options: Options(
          headers: {
            'access-token': token,
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        return ProductModel.fromJson(datas).products;
      }
    } on DioError catch (e) {}
    return null;
  }

  // Gelen veride ürünün favoriye eklenip eklenmediği gelmediği için iptal edildi

  /*  Future<ProductLikeModel?> postProductLike(
      {String? token, int? productId}) async {
    try {
      final response = await _dio.post(HomeServiceEnum.like.name,
          options: Options(headers: {'access-token': token}),
          data: {'productId': productId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        print(datas);
        return ProductLikeModel.fromJson(datas);
      }
    } on DioError catch (e) {}
    return null;
  } */

}
