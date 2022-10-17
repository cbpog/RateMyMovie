import 'package:flutter/material.dart';
import 'package:silver_screen/widgets/trending_list.dart';
import 'package:silver_screen/api_request.dart';

class TrendingList extends StatefulWidget {
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
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
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        TrendingMovies(
          trending: trendingMovies,
          key: UniqueKey(),
        )
      ],
    );
  }
}
