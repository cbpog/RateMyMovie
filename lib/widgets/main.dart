import 'package:flutter/material.dart';
import 'package:silver_screen/api_request.dart';
import 'package:silver_screen/widgets/trendingListBuilder.dart';

import 'package:silver_screen/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silver_screen/loading_page.dart';
import 'package:silver_screen/movie_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
