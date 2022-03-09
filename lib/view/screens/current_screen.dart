import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/current_them_mode.dart';
import 'package:task/providers/bottom_navigation_bar_provider.dart';
import 'package:task/providers/change_theme_provider.dart';
import 'package:task/view/pages/home_page.dart';
import 'package:task/view/pages/search_page.dart';
import 'package:task/view/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo save Pages
    List<Widget> _pages = [
      const UsersListPage(),
      const SearchPage(),
      SettingsPage()
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => ChangeThemeProvider())
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: CurrentThemMode.scaffoldColor,
          body: SafeArea(
            child: _pages[
                context.watch<BottomNavigationBarProvider>().currentIndex],
          ), //todo change screens,
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            currentIndex:
                context.watch<BottomNavigationBarProvider>().currentIndex,
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
