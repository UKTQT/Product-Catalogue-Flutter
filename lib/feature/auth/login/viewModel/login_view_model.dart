import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/auth/login/service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService _loginService = LoginService();

  LoginViewModel() {}
}
