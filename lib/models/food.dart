class Food {
  final List<Meal> meals;

  Food({this.meals});

  factory Food.fromJson(List<dynamic> parsedJson) {
    List<Meal> meals = new List<Meal>();
    meals = parsedJson.map((i) => Meal.fromJson(i)).toList();

    return Food(
        meals: meals
    );
  }
}

class Meal {
  final String type;
  final List<Menu> menu;

  Meal({this.type, this.menu});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        type: json['type'],
        menu: (json['menu'] as List)
            ?.map((e) {
          return e == null ? null : Menu.fromJson(e as Map<String, dynamic>);
        })?.toList()
    );
  }
}

class Menu {
  final String name;
  final num kcal;
  final num protein;
  final num carbohydrate;

  Menu({this.name, this.kcal, this.protein, this.carbohydrate});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        name : json['name'],
        kcal : json['kcal'],
        protein : json['protein'],
        carbohydrate : json['carbohydrate'],
    );
  }
}
