import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:silver_screen/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Splash(),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      backgroundColor: Colors.black,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildLogo(),
        buildTmdb(),
        buildLoadingStatus(),
      ],
    );
  }

  Widget buildLogo() => Container(
        child: const Text(
          "Silver Screen",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      );

  Widget buildTmdb() => Container(
        height: 20,
        child: const Text(
          'Power by TMDB',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
      );

  Widget buildLoadingStatus() => Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      );
}
