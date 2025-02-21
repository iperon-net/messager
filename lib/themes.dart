import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff605fc5);
  static const Color darkPrimaryColor = Color(0xff72538d);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color darkBackgroundColor = Color(0xff1b263b);
  static const Color errorMessageColor = Color(0xffa60909);
  static const Color darkErrorMessageColor = Color(0xffff0000);
  static const Color disableColor = Color(0xff72538d);
  static const Color appBarBackgroundColor = Color(0xff72538d);
  static const Color appBarForegroundColor = Color(0xff72538d);
  static const Color snackBarBackgroundColor = Color(0xffa60909);

  // static const Color primaryColor = Color(0xFF715D00);
  // static const Color secondaryColor = Color(0xffb79f47);
  // static const Color reverseTextButton = Color(0xFFFFFFFF);
  // static const Color appBarBackgroundColor = Color(0xffb79f47);
  // static const Color appBarForegroundColor = Color(0xFFFFFFFF);
  // static const Color snackBarBackgroundColor = Color(0xFFA60909);
}

class AppStyle {
  static const double listTileSize = 13;
  static const double listTileLeadingSize = 18;
}

ThemeData get themeLight {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBackgroundColor,
        foregroundColor: AppColors.appBarForegroundColor,
        titleTextStyle: TextStyle(fontSize: 15)),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        iconColor: AppColors.primaryColor,
        textStyle: TextStyle(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      labelStyle: TextStyle(
        color: AppColors.primaryColor,
      ),
      // isDense: true,
      contentPadding: EdgeInsets.all(12),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: AppColors.primaryColor,
    ),
  );
}
