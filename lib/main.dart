import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/routes/router.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _forRouter = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _forRouter.onGenerate,
    );
  }
}
