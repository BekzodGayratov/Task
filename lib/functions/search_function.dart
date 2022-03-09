import 'package:flutter/widgets.dart';
import 'package:task/providers/search_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:task/services/users_service.dart';

searchFuntions(BuildContext context, String v) {
    context.read<SearchPageProvider>().clearSearchedItems();
    for (var item in UserService.onlineData) {
      if (v.isEmpty) {
        context.read<SearchPageProvider>().clearSearchedItems();
      } else if (item.name!
              .toLowerCase()
              .contains(v.toString().toLowerCase()) ||
          item.username!.toLowerCase().contains(v.toLowerCase())) {
        context.read<SearchPageProvider>().searchItems(item);
      }
    }
  }