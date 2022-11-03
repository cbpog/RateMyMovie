import 'package:flutter/material.dart';
import 'package:silver_screen/widgets/popular_list.dart';
import 'package:silver_screen/network/api_request.dart';
import 'package:silver_screen/widgets/trending_list.dart';

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  TrendingListState createState() => TrendingListState();
}

class TrendingListState extends State<TrendingList> {
  List trendingList = [];
  List popularList = [];
  @override
  void initState() {
    callPosterData();
    super.initState();
  }

  void callPosterData() async {
    var callTrendList = await ApiRequest().fetchTrending();
    var callPopList = await ApiRequest().fetchPopular();
    setState(() {
      trendingList = callTrendList['results'];
      popularList = callPopList['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        TrendingMovies(key: UniqueKey(), trending: trendingList),
        PopularMovies(key: UniqueKey(), popular: popularList),
      ],
    );
  }
}
