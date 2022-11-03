import 'dart:io';
import 'package:flutter/material.dart';

class PopularMovies extends StatelessWidget {
  final List popular;
  final String loadingMessage = 'Title coming soon';
  final posterPlaceHolder = File('assets/comingsoon.jpg');

  PopularMovies({required Key key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Movies',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            height: 2,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              itemCount: popular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              scale: 0.1,
                              'https://image.tmdb.org/t/p/w500${popular[index]['poster_path'] ?? posterPlaceHolder}',
                            )),
                          ),
                        ),
                        Text(
                          popular[index]['title'] ?? loadingMessage,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
