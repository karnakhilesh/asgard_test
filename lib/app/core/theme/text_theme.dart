import 'package:asgard/app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Theme Typography
final TextTheme lightTextTheme = _generateTextTheme(AppColors.dark500);

// Dark Theme Typography
final TextTheme darkTextTheme = _generateTextTheme(AppColors.white500);

// Function to generate TextTheme with Poppins font
TextTheme _generateTextTheme(Color color) =>
    GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 80.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 60.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
