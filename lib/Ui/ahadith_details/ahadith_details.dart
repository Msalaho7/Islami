import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_details_args.dart';
import 'package:provider/provider.dart';
import '../Screens/Widgets/app_scaffold.dart';
import '../providers/theme_provider.dart';

class AhadithDetails extends StatefulWidget {
   const AhadithDetails({Key? key}) : super(key: key);
  static const String routeName = "ahadith_details";

  @override
  State<AhadithDetails> createState() => _AhadithDetailsState();
}

class _AhadithDetailsState extends State<AhadithDetails> {
  String fileContent ="";
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    ScreenDetailsArgs args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if (fileContent.isEmpty){
      readHadithFile(args.fileName);
    }
    return AppScaffold(
       appBar: AppBar(
         leading: BackButton(color: themeProvider.themeColorGold),
         title: Text(args.name, style: themeProvider.mediumTitleTextStyle),
       ),
        title: args.name,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: themeProvider.containerDetailsThem
          ),
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 28,vertical: 60),
          child: SingleChildScrollView(
            child: Text(fileContent,textAlign:
            TextAlign.center, textDirection: TextDirection.rtl,
              style: themeProvider.mediumTitleTextStyle,
            ),),));}

  void readHadithFile(fileName)async{
    Future<String> futureFileContent =
    rootBundle.loadString("assets/files/Ahadith/$fileName");
    fileContent = await futureFileContent;
    setState(() {});
  }
}
