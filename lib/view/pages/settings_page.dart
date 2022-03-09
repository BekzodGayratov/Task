import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/change_theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ChangeThemeProvider(),
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Text(
                        "Dark theme",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch(
                          value:
                              context.watch<ChangeThemeProvider>().isDarkMode,
                          onChanged: (v) {
                            context.read<ChangeThemeProvider>().changeTheme();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ]);
  }
}
