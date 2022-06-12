import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/base/viewModel/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/components/login/login_failed_show_dialog.dart';
import '../service/login_service.dart';
import '../model/login_model.dart';

class LoginViewModel extends ChangeNotifier with BaseViewModel {
  final LoginService _loginService = LoginService();

  // ------------------------- Form Items
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

  // ------------------------- Login Post
  LoginModel? responseVm;
  bool? loginStatus;

  Future postLoginVm(
      {required String password_, required String email_}) async {
    responseVm =
        await _loginService.postLogin(password: password_, email: email_);
    notifyListeners();
    if (responseVm!.token!.isNotEmpty) {
      return loginStatus = true;
    } else {
      return loginStatus = false;
    }
  }

  void failedLogin({required BuildContext context}) {
    loginFailed(context: context);
  }

  // ------------------------- Login Shared Preferences
  void loginSaveSharedPrefences(
      {required String token,
      required String email,
      required String password}) async {
    if (!cache.preferences!.containsKey(email.substring(0, 3))) {
      //if not registered
      cache.preferences!
          .setStringList(email.substring(0, 3), [token, email, password]);
    }

    cache.preferences!.setString('token', token);
  }

  void loginDeleteSharedPrefences({required String email}) async {
    if (cache.preferences!.containsKey(email.substring(0, 3))) {
      cache.preferences!.remove(email.substring(0, 3));
    }
  }
}
