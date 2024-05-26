import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../model/sura_details_args.dart';
import '../Screens/Widgets/app_scaffold.dart';
import '../providers/theme_provider.dart';

class SuraDetails extends StatefulWidget {
    const SuraDetails({Key? key}) : super(key: key);
  static const String routeName = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent ="";
   late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider =Provider.of(context);
    ScreenDetailsArgs args =
    ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
  if (fileContent.isEmpty){
    readSuraFile(args.fileName);
  }
    return AppScaffold(
      appBar: AppBar(
        title: Text(args.name, style: themeProvider.mediumTitleTextStyle),
        leading: BackButton(color: themeProvider.themeColorGold),
      ),
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
            ),
          ),
        ),
    );
  }

  void readSuraFile(fileName)async{
    Future<String> futureFileContent =
    rootBundle.loadString("assets/files/quran/$fileName");
     fileContent = await futureFileContent;
     List<String>fileLines =fileContent.split("\n");
     for(int i =0 ; i<fileLines.length;i++){
       fileLines[i]+="{${i+1}}";
     }
     fileContent=fileLines.join(" ");
     setState(() {});
  }
}
