import 'package:flutter/material.dart';

import '../../../../core/components/register/register_show_dialog.dart';
import '../../../../core/base/viewModel/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../model/register_model.dart';
import '../service/register_service.dart';

class RegisterViewModel extends ChangeNotifier with BaseViewModel {
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
  RegisterModel? responseVm;
  bool? registerStatus;

  Future postRegisterVm(
      {required String name_,
      required String password_,
      required String email_}) async {
    responseVm = await _registerService.postRegister(
        name: name_, password: password_, email: email_);

    if (responseVm!.token!.isNotEmpty || responseVm!.token != null) {
      return registerStatus = true;
    }
    notifyListeners();
  }

  void registerShowDialog({required BuildContext context}) {
    //If the registration is successful, the alert dialog will be displayed and the login view will be sent after 2 seconds.
    showMyDialog(context: context);
    Future.delayed(const Duration(seconds: 2), () {
      navigationServicePoint.navigateToPageClear(
          path: NavigationConstant.LOGIN);
    });
  }
}
