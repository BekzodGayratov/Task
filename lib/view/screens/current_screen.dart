import 'package:flutter/material.dart';
import 'package:task/view/pages/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //todo save Pages
    return Scaffold(
      body: SafeArea(child: UsersListPage(),), //todo change screens,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
