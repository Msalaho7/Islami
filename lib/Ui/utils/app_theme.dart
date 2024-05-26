import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme{
  ///light mood
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold, fontSize: 30
  );
  static const TextStyle mediumTitleTextStyle  = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600, fontSize: 25
  );
  static const TextStyle regularTitleTextStyle = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w400, fontSize: 25
  );
  static ThemeData get lightTheme{
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: appBarTextStyle,
      ),
      colorScheme:const ColorScheme(
          brightness: Brightness.light, primary: AppColors.gold,
          onPrimary: AppColors.onGold, secondary: AppColors.black,
          onSecondary: AppColors.black, error: AppColors.errorColor,
          onError: AppColors.errorColor, surface: AppColors.transparent,
          onSurface: Colors.transparent
      ),
      primaryColor: AppColors.gold,
      dividerColor: AppColors.gold,
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.black,
        unselectedItemColor:AppColors.white,
        selectedIconTheme: IconThemeData(color: AppColors.black, size: 36),
        unselectedIconTheme: IconThemeData(color: AppColors.white, size:34),
      ),
    );
  }

  ///dark mood
  static TextStyle appBarDarkTextStyle =
  appBarTextStyle.copyWith(color: AppColors.white);
  static  TextStyle mediumTitleDarkTextStyle  =
  mediumTitleTextStyle.copyWith(color: AppColors.white) ;
  static  TextStyle regularTitleDarkTextStyle =
  regularTitleTextStyle.copyWith(color: AppColors.white);
  static ThemeData get darkTheme{
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white),
      ),
      colorScheme:const ColorScheme(
          brightness: Brightness.dark, primary: AppColors.darkBlue,
          onPrimary: AppColors.onDarkBlue, secondary: AppColors.yellow,
          onSecondary: AppColors.onYellow, error: AppColors.errorColor,
          onError: AppColors.errorColor, surface: AppColors.transparent,
          onSurface: Colors.transparent
      ),
      primaryColor: AppColors.yellow,
      dividerColor: AppColors.yellow,
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkBlue,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor:AppColors.white,
        selectedIconTheme: IconThemeData(color: AppColors.yellow, size: 36),
        unselectedIconTheme: IconThemeData(color: AppColors.white, size:34),
      ),
    );
  }
}