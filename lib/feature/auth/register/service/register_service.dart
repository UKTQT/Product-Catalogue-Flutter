import 'dart:io';
import 'package:dio/dio.dart';

import '../model/register_model.dart';

enum RegisterServiceEnum { register }

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
      final response = await _dio.post(RegisterServiceEnum.register.name,
          data: {'name': name, 'password': password, 'email': email});
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        return RegisterModel.fromJson(datas);
      }
    } on DioError catch (e) {}
    return null;
  }
}
