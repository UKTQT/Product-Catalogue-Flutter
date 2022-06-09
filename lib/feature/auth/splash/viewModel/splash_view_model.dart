import 'package:flutter/material.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/base/viewModel/base_view_model.dart';

class SplashViewModel extends ChangeNotifier with BaseViewModel {
  SplashViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      militaryGateControl();
    });
  }

  void militaryGateControl() {
    Future.delayed(const Duration(seconds: 2), () {
      navigationServicePoint.navigateToPageClear(
          path: NavigationConstant.LOGIN);
    });
  }
}
