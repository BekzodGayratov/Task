import 'package:flutter/widgets.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
