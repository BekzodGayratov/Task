import 'package:flutter/widgets.dart';
import 'package:task/models/users_model.dart';
import 'package:task/services/users_service.dart';

class SearchPageProvider extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  Set<UserModel> searchedData = {};

  void clearSearchedItems() {
    searchedData.clear();
    notifyListeners();
  }

  void searchItems(UserModel item) {
    searchedData.add(item);
    notifyListeners();
  }
}
