import 'package:cine_flix/datas/category_data.dart';
import 'package:cine_flix/datas/movie_data.dart';
import 'package:cine_flix/filter_service/movie_filter.dart';
import 'package:cine_flix/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class MovieTabFilter extends StatefulWidget {
  final Category result;
  MovieTabFilter(this.result);

  @override
  _MovieTabFilterState createState() => _MovieTabFilterState(result);
}

class _MovieTabFilterState extends State<MovieTabFilter> {
  final Category result;
  _MovieTabFilterState(this.result);
  List<Movies> filteredMovies = List<Movies>();
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

  List<Movies> categoriesMovies() {
    filteredMovies = [];
    for (int i = 0; i < movies.length; i++) {
      if (result.id == null) {
        filteredMovies.add(movies[i]);
      } else {
        if (movies[i].categories == result.id) {
          filteredMovies.add(movies[i]);
        }
      }
    }
    return filteredMovies;
  }

  @override
  Widget build(BuildContext context) {
    categoriesMovies();
    ReCase titleName = ReCase(result.name);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        title: Text("${titleName.titleCase}"),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          ReCase name = new ReCase(filteredMovies[index].name);
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
                          filteredMovies[index].image,
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
                                          MovieScreen(filteredMovies[index])));
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
        itemCount: filteredMovies.length,
      ),
    );
  }
}
