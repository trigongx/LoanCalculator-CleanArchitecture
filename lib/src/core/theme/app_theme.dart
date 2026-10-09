import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.greenM3,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 14.sp, color: Color(0xFF131313)),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Color(0xFF131313),
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xFF131313),
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF131313),
      ),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF7F7F7),
      ),
    ),
    surface: Color(0xFFF7F7F7),
    onSurface: Color(0xFFFFFFFF),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    scheme: FlexScheme.bigStone,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 14.sp, color: Color(0xFFF7F7F7)),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Color(0xFFF7F7F7),
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xFFF7F7F7),
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF7F7F7),
      ),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF131313),
      ),
    ),
    surface: Color(0xFF131313),
    onSurface: Color(0xFF222222),
  );
}
