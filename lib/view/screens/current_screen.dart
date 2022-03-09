import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/bottom_navigation_bar_provider.dart';
import 'package:task/view/pages/home_page.dart';
import 'package:task/view/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo save Pages
    List<Widget> _pages = [const UsersListPage(),SearchPage()];
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationBarProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: _pages[
                context.watch<BottomNavigationBarProvider>().currentIndex],
          ), //todo change screens,
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            currentIndex: context.watch<BottomNavigationBarProvider>().currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
            onTap: (v) {
              context
                  .read<BottomNavigationBarProvider>()
                  .changeIndex(v.toInt());
            },
          ),
        );
      },
    );
  }
}
