import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/Ui/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'SplashScreen/splash_screen.dart';
import 'Ui/Screens/home_screen/home_screen.dart';
import 'Ui/ahadith_details/ahadith_details.dart';
import 'Ui/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) =>LanguageProvider(),
          child: ( const MyApp())
      )
  );
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
       locale:Locale(languageProvider.currentLocale),
       title:"islami",
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_)=> const SplashScreen(),
        HomeScreen.routeName:(_)=>const HomeScreen(),
        SuraDetails.routeName:(_)=> const SuraDetails(),
        AhadithDetails.routeName:(_)=> const AhadithDetails(),
      },
    );
  }

}
