import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle get inter => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle get islandMomentsBold => TextStyle(
    fontFamily: 'Island Moments', // Assure-toi que la police est bien définie dans pubspec.yaml
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.32,
    height: 37 / 32,
    color: Colors.black,
  );
}
