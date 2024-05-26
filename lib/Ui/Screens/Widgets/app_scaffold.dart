import 'package:flutter/material.dart';
import 'package:islami/Ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? bottomNavigation;
  final Widget body ;
  final AppBar? appBar;

  const AppScaffold({Key? key,
     this.title, this.bottomNavigation,
    required this.body,  this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of(context);
    return Container(
        decoration:BoxDecoration(
            image: DecorationImage(image:AssetImage(themeProvider.mainBackGround))),
        child: Scaffold(
          appBar: appBar ?? AppBar(
            title: title != null ? Text(title!, style: themeProvider.mediumTitleTextStyle) : null,
          ),
          backgroundColor: AppColors.transparent,
          bottomNavigationBar:bottomNavigation,
             body: body,));
  }
}