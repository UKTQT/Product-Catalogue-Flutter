import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  NavigationService navigationServicePoint = NavigationService.instance;
}
