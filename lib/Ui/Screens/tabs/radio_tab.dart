import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_assets.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);

    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(AppAssets.radioImage),
        const SizedBox(height: 50),
        Text(
          context.l10n.radioOfQuranKareem,
          style: themeProvider.mediumTitleTextStyle,
        ),
        const SizedBox(height: 35,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.musicLeft,
              color: themeProvider.themeColorGold,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 35),
            Icon(Icons.play_arrow,
                color: themeProvider.themeColorGold, size: 50),
            const SizedBox(width: 35),
            Image.asset(
              AppAssets.musicRight,
              color: themeProvider.themeColorGold,
              width: 30,
              height: 30,
            ),
          ],
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}