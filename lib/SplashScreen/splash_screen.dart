import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Ui/Screens/home_screen/home_screen.dart';
import '../Ui/providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const  SplashScreen({Key? key}) : super(key: key);
  static const routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider =Provider.of(context);
    Future.delayed(
        const Duration(seconds:2), ()
    {Navigator.pushReplacementNamed(context, HomeScreen.routeName);}
    );
    return Scaffold(
      body: Image.asset(
         themeProvider.splashScreen,
        fit: BoxFit.fill,
        width: double.infinity, height:double.infinity,
      ),
    );
  }
}
