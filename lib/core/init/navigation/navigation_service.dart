import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({String? path});
  Future<void> navigateToPageClear({String? path});
}

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage({String? path}) async {
    await navigatorKey.currentState!.pushNamed(path!);
  }

  final removeAllOldRoutes = (Route<dynamic> route) => false;
  @override
  Future<void> navigateToPageClear({String? path}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes);
  }
}
