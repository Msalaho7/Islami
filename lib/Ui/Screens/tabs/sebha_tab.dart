import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
         Text(AppLocalizations.of(context)!.numberOfTasbih,style: AppTheme.mediumTitleTextStyle),
        Expanded(
          child: Container(
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
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.gold,
            ),
          ),
        ),
      ],
    );
  }
}