import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/login_service.dart';
import '../model/login_model.dart';

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

  Future postLoginVm(
      {required String password_, required String email_}) async {
    responseVm =
        await _loginService.postLogin(password: password_, email: email_);

    if (responseVm!.token!.isNotEmpty) {
      return loginStatus = true;
    }
    notifyListeners();
  }

  //Login Shared Preferences
  void loginSaveSharedPrefences(
      {required String token,
      required String email,
      required String password}) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey(email)) {
      //if not registered
      sharedPreferences.setStringList(email, [token, email, password]);
    }

    print(sharedPreferences.getStringList(email));
  }

  void loginDeleteSharedPrefences({required String email}) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(email)) {
      sharedPreferences.remove(email);
    }

    print(sharedPreferences.getStringList(email));
  }
}
