import 'package:flutter/material.dart';

extension MediaQueryShortcuts on BuildContext {
  // Size shortcuts
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get padTop => MediaQuery.of(this).padding.top;
  double get padBottom => MediaQuery.of(this).padding.bottom;
}
