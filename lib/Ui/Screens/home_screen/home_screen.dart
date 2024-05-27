import 'package:flutter/material.dart';
import 'package:islami/Ui/Screens/Widgets/app_scaffold.dart';
import 'package:islami/Ui/utils/app_assets.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import '../tabs/ahadeth_tab.dart';
import '../tabs/quran_tab.dart';
import '../tabs/radio_tab.dart';
import '../tabs/sebha_tab.dart';
import '../tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexSelected = 0;
  Widget body = const QuranTab();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: const BoxDecoration(),
        child: AppScaffold(
          title: context.l10n.islami,
          body: body,
          bottomNavigation: (buildBottomNavigation(context)),
        ),
      );
  }

  Widget buildBottomNavigation(BuildContext context) => BottomNavigationBar(
    items: [
      buildBottomNavigationBarItem(AppAssets.iconQuran, context.l10n.quran),
      buildBottomNavigationBarItem(
          AppAssets.iconHadeth, context.l10n.hadeth),
      buildBottomNavigationBarItem(AppAssets.iconSebha, context.l10n.sebha),
      buildBottomNavigationBarItem(AppAssets.iconRadio, context.l10n.radio),
      buildBottomNavigationBarItem(
          AppAssets.settings, context.l10n.settings),
    ],
    currentIndex: currentIndexSelected,
    type: BottomNavigationBarType.fixed,
    backgroundColor:
    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    onTap: (index) {
      currentIndexSelected = index;
      if (currentIndexSelected == 0) {
        body = const QuranTab();
      } else if (currentIndexSelected == 1) {
        body = const AhadethTab();
      } else if (currentIndexSelected == 2) {
        body = const SebhaTab();
      } else if (currentIndexSelected == 3) {
        body = const RadioTab();
      } else {
        body = SettingsTab(
          onSettingsChanged: (String language, bool darkMode) {});
      }
      setState(() {});
    },
  );
  BottomNavigationBarItem buildBottomNavigationBarItem(
      String path,
      String label,
      ) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(path),
        size: 32,
      ),
      label: label,
    );
  }
}
