import 'package:flutter/material.dart';

import '../service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService _loginService = LoginService();

  //Form Items
  bool _passwordVisiblility = true;
  bool get passwordVisiblility => _passwordVisiblility;

  void passVisibilityChange() {
    _passwordVisiblility = !passwordVisiblility;
    notifyListeners();
  }

  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;

  void checkBoxChange(bool value) {
    _checkBoxValue = value;
    notifyListeners();
  }
}
