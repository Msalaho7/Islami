import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late ThemeProvider themeProvider;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Center(
      child: Column(
        children: [
          Image.asset(AppAssets.headSebhaLogo),
          Image.asset(AppAssets.sebhaLogo),
          const SizedBox(height: 30),
          Text(
            context.l10n.numberOfTasbih,
            style: themeProvider.mediumTitleTextStyle,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              counter++;
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 80,
                  width: 70,
                  decoration: BoxDecoration(
                    color: themeProvider.themeColorOnGold,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Text(
                  "$counter",
                  style: themeProvider.mediumTitleTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  color: themeProvider.themeColorGold,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              Text(context.l10n.thanksGod,
                style: themeProvider.sebhaContainerBlack,)
            ], 
          ),
        ],
      ),
    );
  }
}
