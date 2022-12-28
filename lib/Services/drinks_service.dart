import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drinks/helpers/debouncer.dart';
import 'package:drinks/models/all_drinks.dart';
import 'package:drinks/models/details.dart';
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
  Detail drinkSearched = Detail(drinks: []);

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<Detail> _suggestionStreamController =
      StreamController.broadcast();
  Stream<Detail> get suggestionsStream => _suggestionStreamController.stream;

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

  Future<Detail> searchByName(String name) async {
    var url = "https://thecocktaildb.com/api/json/v1/1/search.php?s=$name";
    var dio = Dio();
    final response = await dio.get(url);
    Detail drink = Detail.fromJson(response.data);
    drinkSearched = drink;
    print(drinkSearched.drinks[0]["idDrink"]);
    notifyListeners();
    return drinkSearched;
  }

  Future<Detail> searchByLetter(String name) async {
    var url = "https://thecocktaildb.com/api/json/v1/1/search.php?f=$name";
    var dio = Dio();
    final response = await dio.get(url);
    Detail drink = Detail.fromJson(response.data);
    drinkSearched = drink;
    print(drinkSearched.drinks[0]["idDrink"]);
    notifyListeners();
    return drinkSearched;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = "";
    debouncer.onValue = (value) async {
      //print("tenemos valor: $value");
      final results = await searchByName(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (_) {
        debouncer.value = searchTerm;
      },
    );
    Future.delayed(
      const Duration(milliseconds: 301),
    ).then((value) => timer.cancel());
  }
}
