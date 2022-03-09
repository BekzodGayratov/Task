import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/functions/search_function.dart';
import 'package:task/providers/search_page_provider.dart';
import 'package:task/widgets/searched_items_list.dart';

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
                      searchFuntions(context, v);
                    },
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: context
                          .watch<SearchPageProvider>()
                          .searchedData
                          .isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return FadeInUpBig(
                                child: SearchedItemsList(index: index));
                          },
                          itemCount: context
                              .watch<SearchPageProvider>()
                              .searchedData
                              .length)
                      : Center(
                          child: FadeInUp(
                              child: Image.asset("assets/notfound.gif")),
                        ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
