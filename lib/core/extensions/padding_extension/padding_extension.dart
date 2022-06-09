import 'package:flutter/material.dart';

extension HeightPaddingExtension on BuildContext {
  double _dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  double get lowHeightPadding => _dynamicHeight(0.01);
  double get lowHeightPadding2 => _dynamicHeight(0.02);
  double get mediumHeightPadding => _dynamicHeight(0.03);
  double get mediumHeightPadding2 => _dynamicHeight(0.04);
  double get highHeightPadding => _dynamicHeight(0.05);
  double get highHeightPadding2 => _dynamicHeight(0.06);
  double get veryHighHeightPadding => _dynamicHeight(0.07);
  double get veryHighHeightPadding2 => _dynamicHeight(0.08);
}

extension WidthPaddingExtension on BuildContext {
  double _dynamicWidth(double val) => MediaQuery.of(this).size.width * val;

  double get lowWidthPadding => _dynamicWidth(0.01);
  double get lowWidthPadding2 => _dynamicWidth(0.02);
  double get mediumWidthPadding => _dynamicWidth(0.03);
  double get mediumWidthPadding2 => _dynamicWidth(0.04);
  double get highWidthPadding => _dynamicWidth(0.05);
  double get highWidthPadding2 => _dynamicWidth(0.06);
  double get veryHighWidthPadding => _dynamicWidth(0.07);
  double get veryHighWidthPadding2 => _dynamicWidth(0.08);
}
