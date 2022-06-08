import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/constants/navigation/navigation_constant.dart';
import 'package:product_catalogue_flutter/feature/auth/login/view/login_view.dart';

import '../../../feature/auth/splash/view/splash_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings path) {
    switch (path.name) {
      case NavigationConstant.DEFAULT:
        return normalNavigate(
            widget: const SplashView(), pageName: NavigationConstant.DEFAULT);
      case NavigationConstant.LOGIN:
        return normalNavigate(
            widget: const LoginView(), pageName: NavigationConstant.LOGIN);

      default:
        return normalNavigate(
            pageName: NavigationConstant.DEFAULT, widget: const SplashView());
    }
  }
}

MaterialPageRoute normalNavigate(
    {required Widget widget, required String pageName}) {
  return MaterialPageRoute(
    builder: (context) => widget,
    settings: RouteSettings(name: pageName),
  );
}
