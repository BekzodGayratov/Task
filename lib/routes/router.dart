import 'package:flutter/material.dart';
import 'package:task/view/screens/current_screen.dart';

class MyRouter {
  Route? onGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context)=> HomePage());
       
    }
  }
}