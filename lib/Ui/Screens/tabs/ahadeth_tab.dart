import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../../model/sura_details_args.dart';
import '../../ahadith_details/ahadith_details.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_assets.dart';

class AhadethTab extends StatefulWidget {

  const AhadethTab({Key? key}) : super(key: key);

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.hadethLogo)),
        Divider(color: themeProvider.themeColorGold, thickness: 3),
        Text(
          context.l10n.ahadith,
          style: themeProvider.mediumTitleTextStyle,
        ),
        Divider(color: themeProvider.themeColorGold, thickness: 3),
        Expanded(
            flex: 7,
            child: Padding(
                padding: const EdgeInsets.all(7.0), child: buildListView()))
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        String ahadithName = "الحديث رقم ${1 + index}";
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AhadithDetails.routeName,
              arguments: ScreenDetailsArgs(
                fileName: "h${index + 1}.txt",
                name: ahadithName,
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  ahadithName,
                  style: themeProvider.regularTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}