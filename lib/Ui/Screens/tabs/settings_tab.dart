import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islami/Ui/providers/language_provider.dart';
import 'package:islami/Ui/providers/theme_provider.dart';
import 'package:islami/Ui/utils/app_colors.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const routeName = "Settings";
  final void Function(String language, bool darkMode) onSettingsChanged;

  const SettingsTab({Key? key, required this.onSettingsChanged})
      : super(key: key);
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = "en";
  late ThemeProvider themeProvider;
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    themeProvider =Provider.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.language,
            style: themeProvider.mediumTitleTextStyle,
          ),
          const SizedBox(height: 12),
          buildLanguageDropDownButton(languageProvider),
          const SizedBox(height: 45),
          buildSwitch(themeProvider),
          const SizedBox(height: 45),
          ElevatedButton(
              onPressed: (){
                addDataToFireBase();
              },
              child:Text(context.l10n.saveSettings
                ,style:themeProvider.mediumTitleTextStyle,)
          ),
        ],
      ),
    );
  }
  Widget buildLanguageDropDownButton(LanguageProvider languageProvider) {
    return DropdownButton<String>(
      value: selectedLanguage,
      dropdownColor: Colors.grey,
      items: [
        DropdownMenuItem(
          value: "en",
          child: Text(
            "English",
            style:themeProvider.mediumTitleTextStyle,
          ),
        ),
        DropdownMenuItem(
          value: "ar",
          child: Text(
            "العربية",
            style: themeProvider.mediumTitleTextStyle,
          ),
        ),
      ],
      isExpanded: true,
      onChanged: (newValue) {
        selectedLanguage = newValue!;
        languageProvider.setCurrentLocale(selectedLanguage);
      },
    );
  }

  Widget buildSwitch(ThemeProvider themeProvider) {
    return Row(
      children: [
        Text(
          context.l10n.darkMode,
          style: themeProvider.mediumTitleTextStyle,
        ),
        const Spacer(),
        Switch(
          inactiveThumbColor: AppColors.gold,
          inactiveTrackColor: AppColors.onGold,
          activeColor: AppColors.onDarkBlue,
          activeTrackColor: AppColors.darkBlue,
          value:switchState,
          onChanged: (newValue) {
            setState(() {
              switchState =newValue;
              themeProvider.toggleTheme(newValue);
            });
          },
        ),
      ],
    );
  }
  void addDataToFireBase() {
    CollectionReference collectionOfSettings =
    FirebaseFirestore.instance.collection("Islami Settings");
    collectionOfSettings.doc().set({
      "selectedLanguage":selectedLanguage,
      "darkMode":switchState
    });
  }}