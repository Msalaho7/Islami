import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_assets.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3,
            child: Image.asset(AppAssets.radioImage)
        ),
         Expanded(
          flex: 2,
          child:Column(
            children: [
              Text(context.l10n.radioOfQuranKareem,style: AppTheme.mediumTitleTextStyle,),
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back,color: AppColors.gold,size: 45),
                  SizedBox(width: 25),
                  Icon(Icons.play_arrow,color: AppColors.gold,size: 70),
                  SizedBox(width: 25),
                  Icon(Icons.arrow_forward,color: AppColors.gold,size: 45),
                ],
              ),
            ],
          )
        )
      ],
    );
  }
}