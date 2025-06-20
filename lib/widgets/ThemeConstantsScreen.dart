import 'package:flutter/material.dart';

/*                                                  P7                                       */
class ThemeConstants {
  static const Color primaryColor = Color(0xFF007A8C);
  static const Color secondaryColor = Color(0xFF53AAD4);
  static const Color buttonColor = Color(0xFF336749);
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color headerColor = Color(0xFFD9D9D9);

  static const double defaultPadding = 20.0;
  static const double borderRadius = 20.0;

  static TextStyle getTitleStyle(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 32),
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    );
  }

  static TextStyle getQuestionStyle(BuildContext context) {
    return TextStyle(
      fontSize: _getResponsiveFontSize(context, 24),
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    );
  }

  static TextStyle getButtonStyle() {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      fontFamily: 'Inter',
    );
  }

  static double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 640) {
      return baseSize * 0.75;
    } else if (screenWidth < 991) {
      return baseSize * 0.875;
    }
    return baseSize;
  }
}