import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsUtils on BuildContext{
  AppLocalizations get l10n{
    return AppLocalizations.of(this)!;
  }
}