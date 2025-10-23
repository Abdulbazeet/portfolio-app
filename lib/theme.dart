import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFEB2F3D),
      surface: Colors.grey[300]!,
      onSurface: Colors.black,
      secondary: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEB2F3D),
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        fixedSize: Size(90.sw, 6.sh),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.sw),
        ),
      ),
    ),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFEB2F3D),
      surface: Colors.black54,
      onSurface: Colors.white,
      secondary: Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
