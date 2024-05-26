import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../../model/sura_details_args.dart';
import '../../providers/theme_provider.dart';
import '../../sura_details/sura_details.dart';
import '../../utils/app_assets.dart';
import '../../utils/constants.dart';

class QuranTab extends StatefulWidget {
   const QuranTab({Key? key}) : super(key: key);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider =Provider.of(context);
    return Column(
      children: [
        Expanded(flex: 3,child: Center(child: Image.asset(AppAssets.mosq))),
        Expanded(flex: 7, child: Stack(
            children: [
              buildScreenContent(context),
              Center(child: VerticalDivider(color: themeProvider.themeColorGold,
                thickness: 3,width: 5,indent: 6,))
            ],
          ),
        ),
      ],
    );
  }

  Widget buildScreenContent(BuildContext context) {
    return Column(
        children: [
          Divider(color: themeProvider.themeColorGold, thickness: 3,),
           Row(children: [
            Expanded(child:Text(context.l10n.verseNumber,textAlign: TextAlign.center,
                style: themeProvider.mediumTitleTextStyle)),
            Expanded(child: Text(context.l10n.suraName,textAlign: TextAlign.center,
                style: themeProvider.mediumTitleTextStyle)),
          ]),
          Divider(color: themeProvider.themeColorGold ,thickness: 3,),
          Expanded(flex: 7,child: buildListView())
        ],
      );
  }

  ListView buildListView() {
    return ListView.builder(
          itemCount: Constant.suraNames.length,
          itemBuilder:(context, index) {
            return InkWell(onTap: (){
              ScreenDetailsArgs arguments = ScreenDetailsArgs(
                  fileName:"${index + 1}.txt" ,
                  name: Constant.suraNames[index]);
              Navigator.pushNamed(context, SuraDetails.routeName,
                  arguments:arguments );
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text("${Constant.versesNumber[index]}",
                        style: themeProvider.regularTitleTextStyle,textAlign: TextAlign.center),
                  ),

                  Expanded(
                    child: Text(Constant.suraNames[index],
                        style: themeProvider.regularTitleTextStyle,textAlign: TextAlign.center),
                  ),
                ],
              ),
            );
          },
        );
  }
}
