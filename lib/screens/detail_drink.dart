import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/drinks_service.dart';

class DetailDrinkScreen extends StatelessWidget {
  const DetailDrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drinksService = Provider.of<DrinksProvider>(context);

    const textStyle = TextStyle(fontSize: 20);
    const textStyle2 = TextStyle(fontSize: 20, color: Colors.orange);
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  image: DecorationImage(
                      image: NetworkImage(drinksService.drinkSearched.drinks[0]
                          ["strDrinkThumb"]!),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.44,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          const Text(
                            "Type: ",
                            style: textStyle,
                          ),
                          Text(
                            drinksService.drinkSearched.drinks[0]
                                ["strAlcoholic"]!,
                            style: textStyle2,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Text(
                            "Glass: ",
                            style: textStyle,
                          ),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strGlass"]!,
                              style: textStyle2),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Text(
                            "Instructions: ",
                            style: textStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Wrap(
                        children: [
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strInstructions"]!,
                              style: textStyle2),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Text(
                            "Ingredients: ",
                            style: textStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 10,
                        children: [
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient1"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient2"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient3"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient4"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient5"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient6"]!,
                              style: textStyle2),
                          Text(
                              drinksService.drinkSearched.drinks[0]
                                  ["strIngredient7"]!,
                              style: textStyle2),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
