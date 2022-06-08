import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? baseViewModelContext;

  void setContext(BuildContext context);
  void init();
}
