import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/search_page_provider.dart';
import 'package:task/services/users_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchPageProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
              child: FadeInRight(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: context.watch<SearchPageProvider>().controller,
                    decoration: InputDecoration(
                        hintText: "Search users",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60.0))),
                    onChanged: (v) {
                      context.read<SearchPageProvider>().clearSearchedItems();
                      for (var item in UserService.onlineData) {
                        if (v.isEmpty) {
                          context
                              .read<SearchPageProvider>()
                              .clearSearchedItems();
                        } else if (item.name!
                                .toLowerCase()
                                .contains(v.toString().toLowerCase()) ||
                            item.username!
                                .toLowerCase()
                                .contains(v.toLowerCase())) {
                          context.read<SearchPageProvider>().searchItems(item);
                        }
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Text(context
                              .watch<SearchPageProvider>()
                              .searchedData
                              .toList()[index]
                              .name
                              .toString()),
                        );
                      },
                      itemCount: context
                          .watch<SearchPageProvider>()
                          .searchedData
                          .length),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
