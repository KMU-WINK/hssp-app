class Food {
  String type;
  List<Menu> menu;

  Food({this.type, this.menu});

  Food.fromJson(Map<String, dynamic> json) {
    this.type = json['type'];
    this.menu = (json['menu'] as List)
        ?.map((e) {
      return e == null ? null : Menu.fromJson(e as Map<String, dynamic>);
    })?.toList();
  }
}

class Menu {
  String name;
  num kcal;
  num protein;
  num carbohydrate;

  Menu({this.name, this.kcal, this.protein, this.carbohydrate});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    kcal = json['kcal'];
    protein = json['protein'];
    carbohydrate = json['carbohydrate'];
  }
}
