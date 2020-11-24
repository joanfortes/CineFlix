class Category {
  String id, name;

  Category(this.name, this.id);

  Category.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
  }
}
