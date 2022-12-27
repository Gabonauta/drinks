import 'package:dio/dio.dart';
import 'package:drinks/models/all_drinks.dart';
import 'package:flutter/cupertino.dart';

import '../models/drinks.dart';

class DrinksProvider extends ChangeNotifier {
  DrinksProvider() {
    loadDrinks();
    loadDrinksNonAlcoholic();
  }

  //Alcoholic or not
  bool _alcoholic = false;
  bool get alcoholic => _alcoholic;
  void drinksAlcoholic() {
    _alcoholic = true;
    notifyListeners();
  }

  void nonAlcoholic() {
    _alcoholic = false;
    notifyListeners();
  }

  List<Drink> drinks = [];
  List<Drink> drinksNonAlcoholic = [];

  Future<List<Drink>> loadDrinks() async {
    var url = "https://thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic";
    var dio = Dio();
    final response = await dio.get(url);
    AllDrinks alldrinks = AllDrinks.fromJson(response.data);
    drinks = alldrinks.drinks;
    notifyListeners();
    return drinks;
  }

  Future<List<Drink>> loadDrinksNonAlcoholic() async {
    var url =
        "https://thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic";
    var dio = Dio();
    final response = await dio.get(url);
    AllDrinks alldrinks = AllDrinks.fromJson(response.data);
    drinksNonAlcoholic = alldrinks.drinks;
    notifyListeners();
    return drinksNonAlcoholic;
  }
}
