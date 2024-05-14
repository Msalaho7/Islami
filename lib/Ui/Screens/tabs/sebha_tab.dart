import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.headSebhaLogo),
        Image.asset(AppAssets.sebhaLogo),
         Text( context.l10n.numberOfTasbih,
             style: AppTheme.mediumTitleTextStyle),
        Container(
          margin: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.gold,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap:() {
                  counter++;
                setState(() {});
                },
                  child: Text(
                      "$counter",
                    style: AppTheme.mediumTitleTextStyle,
                  ),
              ),
            ],
          ),
        ),
        Container(
          margin:const EdgeInsets.all(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}