import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightmode = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFFEB2F3D),
      surface: Colors.grey[400]!,
      onSurface: Colors.black,
      secondary: Colors.white,
    ),
    brightness: Brightness.light,
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
        backgroundColor: Color(0xFFEB2F3D),
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        fixedSize: Size(90.sw, 6.sh),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.sw),
        ),
        // padding: EdgeInsets.symmetric(vertical: 3.sh, horizontal: 4.sw),
      ),
    ),
  );

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
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
