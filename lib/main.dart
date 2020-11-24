import 'package:cine_flix/tabs/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "CineFlix",
    theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 35, 68, 77)),
    debugShowCheckedModeBanner: false,
    home: HomeTab(),
  ));
}
