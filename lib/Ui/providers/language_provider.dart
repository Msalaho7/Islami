import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocale = "en";

  void setCurrentLocale(newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
}