import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/Ui/providers/theme_provider.dart';
import 'package:islami/Ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'SplashScreen/splash_screen.dart';
import 'Ui/Screens/home_screen/home_screen.dart';
import 'Ui/Screens/tabs/settings_tab.dart';
import 'Ui/ahadith_details/ahadith_details.dart';
import 'Ui/providers/language_provider.dart';
import 'Ui/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;
  String selectedLanguage = "en";
  bool switchState = false;

  @override
  void initState() {
    super.initState();
    loadSettingsFromFirebase();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  Future<void> loadSettingsFromFirebase() async {
    CollectionReference collectionOfSettings =
    FirebaseFirestore.instance.collection("Islami Settings");
    QuerySnapshot querySnapshot = await collectionOfSettings.get();
    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
      setState(() {
        selectedLanguage = data["selectedLanguage"] ?? "en";
        switchState = data["darkMode"] ?? false;
        themeProvider.toggleTheme(switchState);
        final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
        languageProvider.setCurrentLocale(selectedLanguage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentThemeMood,
      locale: Locale(languageProvider.currentLocale),
      title: "islami",
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetails.routeName: (_) => const SuraDetails(),
        AhadithDetails.routeName: (_) => const AhadithDetails(),
        SettingsTab.routeName: (_) => SettingsTab(
          onSettingsChanged: (language, darkMode) {
            setState(() {
              selectedLanguage = language;
              switchState = darkMode;
            });
          },
        ),
      },
    );
  }
}