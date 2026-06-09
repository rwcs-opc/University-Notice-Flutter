import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDark = false;

  ThemeMode get currentTheme =>
      isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}