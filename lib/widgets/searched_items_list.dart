import 'package:flutter/material.dart';
import 'package:task/providers/search_page_provider.dart';
import 'package:provider/provider.dart';

class SearchedItemsList extends StatelessWidget {
  final int? index;
  const SearchedItemsList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(40.0)),
        child: Column(
          children: [
            Text(
              context
                  .watch<SearchPageProvider>()
                  .searchedData
                  .toList()[index!]
                  .name
                  .toString(),
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              context
                  .watch<SearchPageProvider>()
                  .searchedData
                  .toList()[index!]
                  .email
                  .toString(),
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white.withOpacity(0.5)),
            )
          ],
        ));
  }
}
