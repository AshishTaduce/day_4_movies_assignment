import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Movies Poster',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: MoviesPage(), // Use stateful widget you created here
    ),
  ));
}

String movies = MoviesList.moviesJsonList;
List movieList = json.decode(movies);

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Map movie1 = movieList[0];
  int index = 0;
  List id = [];
  List poster = [];
  @override
  Widget build(BuildContext context) {
    for (var x in movieList) {
      poster.add(x['poster']);
      id.add(x['id']);
    }
    return Container(
      color: Colors.yellow,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  height: 400.0,
                  items: new List<int>.generate(
                    poster.length - 1,
                    (i) => i + 1,
                  ).map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            //decoration: BoxDecoration(color: Colors.amber),
                            child: Image.network(
                              '${poster[i]}',
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ],
            )));
  }
}
