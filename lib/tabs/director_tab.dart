import 'dart:convert';
import 'package:cine_flix/datas/director_data.dart';
import 'package:cine_flix/screens/director_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recase/recase.dart';

class DirectorTab extends StatefulWidget {
  @override
  _DirectorTabState createState() => _DirectorTabState();
}

class _DirectorTabState extends State<DirectorTab> {
  List<Director> _directors = List<Director>();

  Future<List<Director>> fetchDirectors() async {
    var url = "https://cine-flix.herokuapp.com/directors";
    var response = await http.get(url);
    var directors = List<Director>();
    if (response.statusCode == 200) {
      var moviesJson = json.decode(response.body);
      for (var movieJson in moviesJson) {
        directors.add(Director.fromJson(movieJson));
      }
    }
    return directors;
  }

  @override
  void initState() {
    fetchDirectors().then((value) {
      setState(() {
        _directors.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          ReCase name = new ReCase(_directors[index].name);
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
                        _directors[index].image,
                        fit: BoxFit.cover,
                        height: 230.0,
                      ),
                    ),
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
                                          DirectorScreen(_directors[index])));
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
        itemCount: _directors.length,
      ),
    );
  }
}
