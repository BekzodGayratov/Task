import 'package:flutter/widgets.dart';

class ChangeThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
