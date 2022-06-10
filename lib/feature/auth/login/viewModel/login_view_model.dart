import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/auth/login/model/login_model.dart';

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

  //Login Post
  LoginModel? responseVm;
  bool? loginStatus;

  Future postRegisterVm(
      {required String password_, required String email_}) async {
    responseVm =
        await _loginService.postLogin(password: password_, email: email_);

    if (responseVm!.token!.isNotEmpty || responseVm!.token != null) {
      return loginStatus = true;
    }
    notifyListeners();
  }
}
