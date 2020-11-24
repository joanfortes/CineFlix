import 'package:cine_flix/datas/category_data.dart';
import 'package:cine_flix/filter_service/category_filter.dart';
import 'package:cine_flix/tabs/filtered_tab.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<Category> categories = List();
  Category allMovies = new Category("Todos os filmes", null);
  @override
  void initState() {
    super.initState();
    ServicesCat.getCategories().then((categoriesFromServer) {
      setState(() {
        categories = categoriesFromServer;
        categories.removeAt(0);
        categories.add(allMovies);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return categories.map((Category category) {
          ReCase titlecaseName = ReCase(category.name);
          return PopupMenuItem(
            value: category,
            child: ListTile(
              title: Text(titlecaseName.titleCase),
            ),
          );
        }).toList();
      },
      onSelected: _orderList,
    );
  }

  void _orderList(Category category) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MovieTabFilter(category)));
  }
}
