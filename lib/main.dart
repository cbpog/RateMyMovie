import 'package:flutter/material.dart';
import 'package:silver_screen/api_request.dart';
import 'package:silver_screen/auth_info.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widgets/trending_list.dart';

void main() {
  // runApp(MyApp());
  ApiRequest().fetchMovies();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authentication(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
    );
  }
}
