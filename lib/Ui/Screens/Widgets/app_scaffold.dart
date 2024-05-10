import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomNavigation;
  final Widget body ;

  const AppScaffold({Key? key, required this.title,
  this.bottomNavigation, required this.body
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image:AssetImage(AppAssets.background))),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            centerTitle: true,
            title: Text(title),
            titleTextStyle: AppTheme.appBarTextStyle,
          ),
          backgroundColor: AppColors.transparent,
          bottomNavigationBar:bottomNavigation,
             body: body,

        ));
  }
}
