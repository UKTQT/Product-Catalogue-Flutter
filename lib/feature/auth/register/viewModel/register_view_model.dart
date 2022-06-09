import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

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

  bool _checkBoxValue = false;
  bool get checkBoxValue => _checkBoxValue;

  void checkBoxChange(bool value) {
    _checkBoxValue = value;
    notifyListeners();
  }
}
