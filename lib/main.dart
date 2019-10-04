import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black ,
      appBar: AppBar(
        title: Text(
          'Movies Poster',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: MoviesPage(),// Use stateful widget you created here
    ),
  ));

}

// You are given json string of movies list (see file movies.dart)
String movies = MoviesList.moviesJsonList;
List movieList = json.decode(movies);



// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  Map movie1 = movieList[0];



  List id = movieList.toList();
  List poster = [];
  @override
  Widget build(BuildContext context) {
    for(var x in movieList){
      poster.add(x['poster']);
      id.add(x['id']);
    }


    return Container(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Image.network('$imageurl'),
            Image.network(poster[5]),
            RaisedButton(
              color: Colors.yellow,
              textColor: Colors.black,
              child: const Text(
                  'Next Movie',
                  style: TextStyle(fontSize: 20)
              ),
            )
          ],
        )
    );
  }
}


