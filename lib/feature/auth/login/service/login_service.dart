import 'dart:io';
import 'package:dio/dio.dart';

import '../model/login_model.dart';

enum RegisterServiceEnum { login }

abstract class ILoginService {
  Future<LoginModel?> postLogin({
    required String password,
    required String email,
  });
}

class LoginService extends ILoginService {
  late final Dio _dio;

  LoginService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://assignment-api.piton.com.tr/api/v1/user/',
      ),
    );
  }

  @override
  Future<LoginModel?> postLogin(
      {required String password, required String email}) async {
    try {
      final response = await _dio.post(RegisterServiceEnum.login.name,
          data: {'password': password, 'email': email});
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        print(datas);

        return LoginModel.fromJson(datas);
      }
    } on DioError catch (e) {
      //
    }
    return null;
  }
}
