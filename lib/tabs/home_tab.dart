import 'package:cine_flix/tabs/director_tab.dart';
import 'package:cine_flix/tabs/movie_tab.dart';
import 'package:cine_flix/widgets/custom_drawer.dart';
import 'package:cine_flix/widgets/dropdown_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

const request = "https://cine-flix.herokuapp.com/";

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

Future<dynamic> getData() async {
  http.Response response = await http.get(request);
  return response.body;
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: Scaffold(
              drawer: CustomDrawer(_pageController),
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text("CineFlix"),
                backgroundColor: Colors.red,
                centerTitle: true,
              ),
              body: FutureBuilder<dynamic>(
                  future: getData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                            child: Text(
                          "Carregando Dados",
                          style: TextStyle(color: Colors.red, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ));
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            "Erro ao Carregar Dados",
                            style: TextStyle(color: Colors.red, fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ));
                        } else {
                          return Center(
                            child: Text(
                              "${snapshot.data}".toUpperCase(),
                              style:
                                  TextStyle(color: Colors.red, fontSize: 30.0),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                    }
                  })),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
            backgroundColor: Colors.red,
            centerTitle: true,
            actions: <Widget>[CustomDropdown()],
          ),
          drawer: CustomDrawer(_pageController),
          body: MovieTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Directors"),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: DirectorTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
