import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mazraa/theme.dart';
import 'package:mazraa/theme_service.dart';
import 'package:provider/provider.dart';

import 'application/screens/main_screen/main_screen_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'application/screens/splassh_screen/splash_screen.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeService.isDarkMode? ThemeMode.dark : ThemeMode.light,
        home: const SplashScreen(),
      );
    });

  }
}
