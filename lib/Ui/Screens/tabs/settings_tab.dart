import 'package:flutter/material.dart';
import 'package:islami/Ui/providers/language_provider.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage="en";
  late LanguageProvider languageProvider ;

  @override
  Widget build(BuildContext context) {
    languageProvider=Provider.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.l10n.language,style: AppTheme.regularTitleTextStyle,),
           const SizedBox(height: 12,),
          buildLanguageDropDownButton()
        ],
      ),
    );
  }

  Widget buildLanguageDropDownButton() {
    return DropdownButton <String> (
      value: selectedLanguage,
        items: const[
          DropdownMenuItem(value: "en",child: Text("English",),),
          DropdownMenuItem(value: "ar",child: Text("العربية",),),
        ],
      isExpanded: true,
      onChanged: (newValue){
        selectedLanguage=newValue!;
        languageProvider.setCurrentLocale(selectedLanguage);
        setState((){});
      },
      // onChanged: ,
    );
  }
}
