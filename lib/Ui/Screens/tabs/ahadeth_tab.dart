import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import '../../../model/sura_details_args.dart';
import '../../ahadith_details/ahadith_details.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';


class AhadethTab extends StatelessWidget {
  const AhadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3,child: Image.asset(AppAssets.hadethLogo)),
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Divider(color: AppColors.gold,thickness: 3),
        ),
         Text(context.l10n.ahadith,style: AppTheme.mediumTitleTextStyle,),
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Divider(color: AppColors.gold,thickness: 3),
        ),
         Expanded(flex: 7,child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: buildListView()
        ))

      ],
    );
  }
  ListView buildListView() {
    return ListView.builder(
      itemCount:50 ,
      itemBuilder:(context, index) {
        String ahadithName = "الحديث رقم ${ 1 + index}";

        return InkWell(onTap: () {
          Navigator.pushNamed(context, AhadithDetails.routeName,
          arguments: ScreenDetailsArgs(fileName:"h${index+1}.txt",
              name:ahadithName )
          );

        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text( ahadithName,
                    style: AppTheme.regularTitleTextStyle,
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        );
      },
    );
  }

}