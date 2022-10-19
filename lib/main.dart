import 'package:flutter/material.dart';
import 'package:silver_screen/network/api_request.dart';
import 'package:silver_screen/pages/loading_page.dart';
import 'package:silver_screen/pages/suggestion_page.dart';

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
