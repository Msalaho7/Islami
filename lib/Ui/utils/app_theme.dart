import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme{
  static const appBarTextStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold, fontSize: 30
  );
  static const mediumTitleTextStyle = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600, fontSize: 25
  );
  static const regularTitleTextStyle = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w400, fontSize: 25
  );
}