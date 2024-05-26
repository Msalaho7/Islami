import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_assets.dart';
import 'package:islami/Ui/utils/app_colors.dart';
import 'package:islami/Ui/utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentThemeMood=ThemeMode.light;

   toggleTheme (bool darkThemeSwitchValue){
    currentThemeMood = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  String get mainBackGround =>
    currentThemeMood == ThemeMode.light ?
    AppAssets.background: AppAssets.backgroundDark;

  TextStyle get appBarTextStyle =>
      currentThemeMood == ThemeMode.light ?
      AppTheme.appBarTextStyle : AppTheme.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle =>
      currentThemeMood == ThemeMode.light ?
      AppTheme.mediumTitleTextStyle :  AppTheme.mediumTitleDarkTextStyle;

  TextStyle get regularTitleTextStyle =>
      currentThemeMood == ThemeMode.light ?
      AppTheme.regularTitleTextStyle :  AppTheme.regularTitleDarkTextStyle;

  TextStyle get sebhaContainerBlack =>
      currentThemeMood == ThemeMode.light ?
      AppTheme.mediumTitleTextStyle.copyWith(color:AppColors.white ) :
      AppTheme.mediumTitleDarkTextStyle.copyWith(color:AppColors.black );

    Color get containerDetailsThem =>
      currentThemeMood == ThemeMode.light ?
      AppColors.gold: AppColors.containerDarkDetails;

  Color get themeColorGold =>
      currentThemeMood == ThemeMode.light ?
      AppColors.gold: AppColors.yellow;

  String get splashScreen =>
      currentThemeMood ==ThemeMode.light?
      AppAssets.splash : AppAssets.splashDark;

  Color get themeColorOnGold =>
      currentThemeMood == ThemeMode.light ?
      AppColors.onGold: AppColors.darkBlue;
}