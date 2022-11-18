

import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../main_screen/main_screen_page.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      AnimatedSplashScreen(
          splashIconSize: 400,
          duration: 3000,
          splash:SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Image.asset('assets/images/logo.jpg',
                 width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('المزرعة',style: Theme.of(context).textTheme.headline3,),
                SizedBox(
                  height: 10.0,
                ),
                CircularProgressIndicator(color: Colors.lightGreen,)
              ],
            ),
          ),
          nextScreen: const MainScreenWrapper(),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
          backgroundColor: Colors.white),
    );
  }
}
