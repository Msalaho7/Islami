import 'package:flutter/material.dart';
import 'package:islami/Ui/utils/app_localization_utils.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late ThemeProvider themeProvider;
  List<String> azkar = ["الحمدلله","سبحان الله","الله أكبر","أستغفر الله" ];
  int index = 0 ;
  int counter = 0;
  double turns =0 ;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Center(
      child: Column(
        children: [
          Expanded(flex:3, child: AnimatedRotation(
              duration: const Duration(seconds: 3),
              turns: turns,
              child: Image.asset(themeProvider.sebhaBodyMode))),
          const SizedBox(height: 43),
          Expanded(flex:3, child: Column(
            children: [
              Text(
                context.l10n.numberOfTasbih,
                style: themeProvider.mediumTitleTextStyle,
              ),
              const SizedBox(height: 26),
              Stack(
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
              const SizedBox(height: 22),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                    turns+=0.09;
                    if (counter>30){
                      counter=0;
                      index++;
                      if(index==azkar.length){
                        index=0;
                      }
                    }
                  });
                },
                child: Stack(
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
                    Text(
                      azkar[index],
                      style: themeProvider.sebhaContainerBlack,
                    )
                  ],
                ),
              ),
            ],
          ))

        ],
      ),
    );
  }
}
