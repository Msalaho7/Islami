import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Ui/utils/app_colors.dart';
import 'package:islami/Ui/utils/app_theme.dart';
import 'package:islami/model/sura_details_args.dart';

import '../Screens/Widgets/app_scaffold.dart';

class AhadithDetails extends StatefulWidget {
  const AhadithDetails({Key? key}) : super(key: key);
  static const String routeName = "ahadith_details";

  @override
  State<AhadithDetails> createState() => _AhadithDetailsState();
}

class _AhadithDetailsState extends State<AhadithDetails> {
  String fileContent ="";

  @override
  Widget build(BuildContext context) {
    ScreenDetailsArgs args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if (fileContent.isEmpty){
      readHadithFile(args.fileName);
    }
    return AppScaffold(
        title: args.name,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.gold
          ),
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 28,vertical: 60),
          child: SingleChildScrollView(
            child: Text(fileContent,textAlign:
            TextAlign.center, textDirection: TextDirection.rtl,
              style: AppTheme.mediumTitleTextStyle,
            ),
          ),
        ));
  }

  void readHadithFile(fileName)async{
    Future<String> futureFileContent =
    rootBundle.loadString("assets/files/Ahadith/$fileName");
    fileContent = await futureFileContent;
    setState(() {});
  }
}
