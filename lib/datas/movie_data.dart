import 'category_data.dart';
import 'director_data.dart';
import 'package:recase/recase.dart';

class Movies {
  String id,name,image,categories,directors;
  int year;


  Movies(this.id,this.name,this.year,this.image,this.categories,this.directors);

  Movies.fromJson(Map<String,dynamic>json){
    id = json["id"];
    name = json["name"];
    image = json["image"];
    year = json["year"];
    directors = json["directorId"];
    categories = json["categoryId"];
  }
}