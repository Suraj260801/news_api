import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:news_api/pages/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.blueGrey,
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: const Duration(seconds: 2),

      splash: Center(
        child: SizedBox(
          height: 200,
          child: Image.asset(
               'assets/icons/news.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      nextScreen:const HomePage(),
    ) ;
  }
}
