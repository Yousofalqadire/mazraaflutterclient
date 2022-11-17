import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mazraa/theme.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import 'application/screens/main_screen/main_screen_page.dart';

void main() {
      runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child:const MyApp()
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeService>(builder: (context,themeService,child){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeService.isDarkMode? ThemeMode.dark : ThemeMode.light,
        home: const MainScreenWrapper(),
      );
    });

  }
}

