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
  List id =[];
  List poster = [];
  String imageurl = "https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture-Kotlin/posters/038001.jpg";
  @override
  Widget build(BuildContext context) {

  int index = 0;
  int i = 1;

    return Container(
        child : Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Image.network('$imageurl',),),
            Expanded(
              flex: 2,
              child: RaisedButton(
                color: Colors.yellow,
                textColor: Colors.white,
                child: const Text(
                    'Next Movie',
                    style: TextStyle(fontSize: 20)
                ),
                onPressed: (){
                  setState(() {
                    imageurl = poster [index+i];
                    i++;
                    if (index == poster.length){
                      index = 0;
                    }
                  });
                },
              ),
            )
          ],
        )
    );
  }
}


