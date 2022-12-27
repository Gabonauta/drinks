import 'dart:convert';

import 'drinks.dart';

AllDrinks allDrinksFromJson(String str) => AllDrinks.fromJson(json.decode(str));

String allDrinksToJson(AllDrinks data) => json.encode(data.toJson());

class AllDrinks {
  AllDrinks({
    required this.drinks,
  });

  List<Drink> drinks;

  factory AllDrinks.fromJson(Map<String, dynamic> json) => AllDrinks(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
