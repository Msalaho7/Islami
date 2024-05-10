import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';
import '../tabs/ahadeth_tab.dart';
import '../tabs/quran_tab.dart';
import '../tabs/radio_tab.dart';
import '../tabs/sebha_tab.dart';
import '../tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexSelected=0 ;
  Widget body = const QuranTab();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.background))),
        child: Scaffold(
          appBar: buildAppBar(context),
          backgroundColor: AppColors.transparent,
          bottomNavigationBar:
          Padding(padding: const EdgeInsets.only(left: 6,right: 6),
           child: buildBottomNavigation(context)) ,
          body: body,

        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      title:  Text(AppLocalizations.of(context)!.islami),
      titleTextStyle: AppTheme.appBarTextStyle,
    );
  }

 Widget buildBottomNavigation(BuildContext context) => BottomNavigationBar(
   type: BottomNavigationBarType.fixed,
   backgroundColor: AppColors.gold,
   selectedItemColor: AppColors.black,
   items: [
   buildBottomNavigationBarItem(AppAssets.iconQuran,
       AppLocalizations.of(context)!.quran),
     buildBottomNavigationBarItem(AppAssets.iconHadeth,
         AppLocalizations.of(context)!.hadeth),
     buildBottomNavigationBarItem(AppAssets.iconSebha,
         AppLocalizations.of(context)!.sebha),
     buildBottomNavigationBarItem(AppAssets.iconRadio,
         AppLocalizations.of(context)!.radio),
     buildBottomNavigationBarItem(AppAssets.sebhaLogo,
         AppLocalizations.of(context)!.settings),
   ],
   unselectedItemColor: AppColors.white,
   currentIndex: currentIndexSelected,
   onTap: (index){
     currentIndexSelected =index;
     if(currentIndexSelected==0){
       body=const QuranTab();
     }else if (currentIndexSelected==1){
       body=const AhadethTab();
     }else if (currentIndexSelected ==2){
       body=const SebhaTab();
     }else if (currentIndexSelected ==3){
       body=const RadioTab();
     }
     else{
       body=const SettingsTab();
     }
     setState(() {});
   },
 );

 BottomNavigationBarItem buildBottomNavigationBarItem(
     String path , String label,) {
   return BottomNavigationBarItem(icon: ImageIcon(AssetImage(path),
     size: 32,), label: label,);
 }
}