import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final List trending;
  final descriptionMessage = 'Movie Description: ';
  const MovieCard({required Key key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: movieCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                            trending[0]['poster_path']),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    trending[0]['title'],
                    style: textStyleTitle(),
                  ),
                  Text(
                    trending[0]['release_date'], //placeholder for date
                    style: textStyleSubText(),
                  ),
                  Text(
                    'genre', //placeholder for genre
                    style: textStyleSubText(),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              descriptionMessage + trending[0]['overview'],
              style: textStyleSubText(),
            ),
          ),
        ],
      ),
    );
  }
}

movieCardDecoration() => BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.lightBlueAccent, Colors.purple],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.7, 1],
    ),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(30)));

textStyleSubText() => const TextStyle(
      fontSize: 15,
      color: Colors.black,
    );

textStyleTitle() => const TextStyle(
      fontSize: 25,
      color: Colors.black,
    );
