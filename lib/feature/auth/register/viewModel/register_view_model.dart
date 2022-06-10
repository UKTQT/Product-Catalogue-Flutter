import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../model/register_model.dart';
import '../service/register_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterService _registerService = RegisterService();

  //Form Items
  bool _passwordVisiblility = true;
  bool get passwordVisiblility => _passwordVisiblility;

  void passVisibilityChange() {
    _passwordVisiblility = !passwordVisiblility;
    notifyListeners();
  }

  bool _passwordAgainVisiblility = true;
  bool get passwordAgainVisiblility => _passwordAgainVisiblility;

  void passAgainVisibilityChange() {
    _passwordAgainVisiblility = !passwordAgainVisiblility;
    notifyListeners();
  }

  //Register Post

  Future<RegisterModel?> postRegisterVm(
      {required String name_,
      required String password_,
      required String email_}) async {
    final responseVm = await _registerService.postRegister(
        name: name_, password: password_, email: email_);
    print(responseVm?.token);

    notifyListeners();
  }
}
