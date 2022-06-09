import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_catalogue_flutter/feature/auth/register/model/register_model.dart';

abstract class IRegisterService {
  Future<RegisterModel?> postRegister({
    required String name,
    required String password,
    required String email,
  });
}

class RegisterService extends IRegisterService {
  late final Dio _dio;
  RegisterService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://assignment-api.piton.com.tr/api/v1/user/',
      ),
    );
  }

  @override
  Future<RegisterModel?> postRegister(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final response = await _dio.post('register',
          data: {'name': name, 'password': password, 'email': email});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is Map<String, dynamic>) {
          return RegisterModel.fromMap(_datas['token']);
        }
      }
    } on DioError catch (e) {
      return null;
    }
  }
}
