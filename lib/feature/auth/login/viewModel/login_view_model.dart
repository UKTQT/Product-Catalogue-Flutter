import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/auth/login/service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService _loginService = LoginService();

  //Validation
  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;

  void checkBoxChange(bool value) {
    _checkBoxValue = value;
    notifyListeners();
  }
}
