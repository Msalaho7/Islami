import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import '../../../model/sura_details_args.dart';
import '../../sura_details/sura_details.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';


class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3,child: Center(child: Image.asset(AppAssets.mosq))),
        Expanded(flex: 7, child: Stack(
            children: [
              buildScreenContent(context),
              const Center(child: VerticalDivider(color: AppColors.gold,
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
          const Padding(
            padding: EdgeInsets.only(right: 6,left: 6),
            child: Divider(color: AppColors.gold,thickness: 3,),
          ),
           Row(children: [
            Expanded(child:Text(context.l10n.verseNumber,textAlign: TextAlign.center,
                style: AppTheme.mediumTitleTextStyle)),
            Expanded(child: Text(context.l10n.suraName,textAlign: TextAlign.center,
                style: AppTheme.mediumTitleTextStyle)),
          ]),
          const Padding(
            padding: EdgeInsets.only(right: 6,left: 6),
            child: Divider(color: AppColors.gold,thickness: 3,),
          ),
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
                        style: AppTheme.regularTitleTextStyle,textAlign: TextAlign.center),
                  ),

                  Expanded(
                    child: Text(Constant.suraNames[index],
                        style: AppTheme.regularTitleTextStyle,textAlign: TextAlign.center),
                  ),
                ],
              ),
            );
          },
        );
  }
}
