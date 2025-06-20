import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle titleArabic = TextStyle(
    fontSize: 60,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const TextStyle subtitleArabic = TextStyle(
    fontSize: 34,
    color: Color(0xFF007A8C),
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static const TextStyle descriptionArabic = TextStyle(
    fontSize: 36,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Arbutus',
    height: 1.36, // Equivalent to line-height: 49px
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
}