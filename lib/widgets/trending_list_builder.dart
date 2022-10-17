import 'package:flutter/material.dart';
import 'package:silver_screen/widgets/trending_list.dart';
import 'package:silver_screen/network/api_request.dart';

class TrendingList extends StatefulWidget {
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  List trendingMovies = [];
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
