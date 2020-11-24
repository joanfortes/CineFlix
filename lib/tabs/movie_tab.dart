import 'package:cine_flix/datas/movie_data.dart';
import 'package:cine_flix/filter_service/movie_filter.dart';
import 'package:cine_flix/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class MovieTab extends StatefulWidget {
  @override
  _MovieTabState createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  List<Movies> movies = List();

  @override
  void initState() {
    super.initState();
    Services.getMovies().then((moviesFromServer) {
      setState(() {
        movies = moviesFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          ReCase name = new ReCase(movies[index].name);
          return Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Image.network(
                          movies[index].image,
                          fit: BoxFit.cover,
                          height: 250.0,
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                name.titleCase,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          MovieScreen(movies[index])));
                                },
                                child: Text(
                                  "Ver Info",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                color: Colors.red,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ));
        },
        itemCount: movies.length,
      ),
    );
  }
}
