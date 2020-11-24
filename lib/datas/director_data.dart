class Director {
  String id,name,image;

  Director(this.id,this.image,this.name);

  Director.fromJson(Map<String,dynamic>json){
    name = json["name"];
    id = json["id"];
    image = json["image"];
  }
}