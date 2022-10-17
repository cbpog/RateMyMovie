import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:silver_screen/movie_card.dart';
import 'package:silver_screen/widgets/trendingListBuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 3;

  final tabs = [
    Center(child: Text("Watch Later")),
    TrendingList(),
    Center(child: Text("Profile")),
    Stack(
      children: <Widget>[
        MovieCard(color: Colors.grey),
        MovieCard(color: Colors.purple),
        MovieCard(color: Colors.cyan),
        MovieCard(color: Colors.deepOrange),
        MovieCard(color: Colors.greenAccent),
      ],
    ),
    Center(child: Text("My List")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Logo and page title
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: buildTitle(),
      ),

      body: tabs[_currentIndex],

      //Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 28.0),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabBorderRadius: 25,
            backgroundColor: Colors.black,
            color: const Color.fromRGBO(237, 237, 237, 80),
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.airplay, text: "Saved"),
              GButton(icon: Icons.bolt_outlined, text: "Trending"),
              GButton(icon: Icons.assignment_ind, text: "Profile"),
              GButton(icon: Icons.lightbulb_outline, text: "For You"),
              GButton(icon: Icons.favorite_border, text: "Likes"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() => Row(
        children: const [
          SizedBox(width: 4),
          Text(
            "Silver Screen",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          ),
        ],
      );
}
