import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({String? path});
}
