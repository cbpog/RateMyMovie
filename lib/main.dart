import 'package:flutter/material.dart';
import 'package:silver_screen/pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silver Screen',
      theme: ThemeData(
        textTheme: const TextTheme(
            //Movie Title
            titleLarge: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            //Release Date
            labelMedium: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            //Description
            headlineMedium: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
