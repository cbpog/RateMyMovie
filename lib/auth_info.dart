import 'package:flutter/material.dart';
import 'package:silver_screen/widgets/trending_list.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:silver_screen/api_request.dart';

//ignore Class for now!! Don't edit
class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  late String posterAccess;
  final String apiKey = '41187f96bab5c76a36c08caf7793a818';
  final String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MTE4N2Y5NmJhYjVjNzZhMzZjMDhjYWY3NzkzYTgxOCIsInN1YiI6IjYzMzQ2OTIyOGEwZTliMDA3YjdjYTlhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qiOBbmxp4eYSOdSpApHL8KsSpQKXVwLIj_emlTYDxDw';

  @override
  void initState() {
    callPosterData();
    super.initState();
  }

  void callPosterData() async {
    var callList = await ApiRequest().fetchPoster();
    setState(() {
      trendingMovies = callList['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('SilverScreen'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TrendingMovies(
            trending: trendingMovies,
            key: UniqueKey(),
          )
        ],
      ),
    );
  }
}
