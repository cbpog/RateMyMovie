import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:silver_screen/movie_responsibilites/movie_card.dart';
import 'package:silver_screen/pages/suggestion_page.dart';
import 'package:silver_screen/widgets/popular_list.dart';
import '../widgets/trending_list_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 3;

  final tabs = [
    //Saved
    Center(child: Text("Watch Later")),

    //Trending List
    TrendingList(),

    //Profile
    Center(child: Text("Profile")),

    //Suggestion
    SuggestionPage(),

    //Likes
    Center(child: Text("My List")),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('lib/images/circles_pattern_black_white.png'),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 28.0),
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
                color: Colors.white),
          ),
        ],
      );
}
