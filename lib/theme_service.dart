

import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkMode = false;

  toggleTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}