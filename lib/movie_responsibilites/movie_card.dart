import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class MovieCard extends StatelessWidget {
  final color;

  MovieCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Swipable(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        ),
      ),
    );
  }
}
