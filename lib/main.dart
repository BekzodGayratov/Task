import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/routes/router.dart';
import 'package:task/services/users_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  UserService.registerAdapter();
  await UserService.openBox();
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
