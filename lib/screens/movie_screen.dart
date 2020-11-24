import 'package:cine_flix/datas/movie_data.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class MovieScreen extends StatefulWidget {
  final Movies movies;
  MovieScreen(this.movies);

  @override
  _MovieScreenState createState() => _MovieScreenState(movies);
}

class _MovieScreenState extends State<MovieScreen> {
  final Movies movies;

  _MovieScreenState(this.movies);
  @override
  Widget build(BuildContext context) {
    ReCase name = ReCase(movies.name);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movies.name),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 0.7,
              child: Image.network(
                movies.image,
                fit: BoxFit.fill,
                height: 200.0,
              )),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  name.titleCase,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  movies.year.toString(),
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
