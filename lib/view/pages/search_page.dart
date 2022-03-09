import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/search_page_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchPageProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              TextFormField(
                controller: context.watch<SearchPageProvider>().controller,
              ),
            ],
          )),
        );
      },
    );
  }
}
