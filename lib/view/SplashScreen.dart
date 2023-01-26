import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:descend/view/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splashIconSize: 700,
      splash: 'images/imgs/splash.png',
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,

    );
  }
}
