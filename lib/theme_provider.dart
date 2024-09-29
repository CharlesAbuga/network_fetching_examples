import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChange(this._themeData);

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
