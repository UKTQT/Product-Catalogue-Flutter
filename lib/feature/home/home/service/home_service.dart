import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

enum HomeServiceEnum { all }

abstract class IHomeService {
  Future<ProductModel?> fetchAllProducts();
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
  Future<ProductModel?> fetchAllProducts() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    try {
      final response = await _dio.get(
        HomeServiceEnum.all.name,
        options: Options(
          headers: {
            'access-token': sharedPreferences.getString('token'),
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        return ProductModel.fromJson(datas);
      }
    } on DioError catch (e) {}
    return null;
  }
}
