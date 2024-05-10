import 'package:flutter/material.dart';
import '../Ui/Screens/home_screen/home_screen.dart';
import '../Ui/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds:2), ()
    {Navigator.pushReplacementNamed(context, HomeScreen.routeName);}
    );
    return Scaffold(
      body: Image.asset(
         AppAssets.splash,
        fit: BoxFit.fill,
        width: double.infinity, height:double.infinity,
      ),
    );
  }
}
