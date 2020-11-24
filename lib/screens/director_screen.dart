import 'file:///C:/Users/Joan/AndroidStudioProjects/cine_flix/lib/datas/director_data.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class DirectorScreen extends StatefulWidget {

  Director directors;

  DirectorScreen(this.directors);

  @override
  _DirectorScreenState createState() => _DirectorScreenState(directors);
}

class _DirectorScreenState extends State<DirectorScreen> {
  final Director directors;

  _DirectorScreenState(this.directors);
  @override
  Widget build(BuildContext context) {
    ReCase name = ReCase(directors.name);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(directors.name),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 0.7,
              child: Image.network(
                directors.image,
                fit: BoxFit.cover,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
