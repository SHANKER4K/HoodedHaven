import 'package:flutter/material.dart';

class ResponsiveSize {
  static double responsiveSize(BuildContext context, double designSize) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height; // Assuming portrait mode
    final designHeight = 800.0; // Replace with your design height

    return designSize * (screenHeight / designHeight);
  }
}