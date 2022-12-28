import 'package:drinks/screens/alcoholic_drinks.dart';
import 'package:drinks/screens/detail_drink.dart';
import 'package:drinks/screens/widgets/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/drinks_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drinksService = Provider.of<DrinksProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Find your drink"),
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: DrinkSearchDelegate()),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.black.withOpacity(0.5),
                    onPressed: () {
                      drinksService.drinksAlcoholic();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const AlcoholicScreen(),
                            transitionDuration: const Duration(seconds: 1)),
                      );
                    },
                    child: const Text(
                      "Alcoholic",
                      style: TextStyle(fontSize: 35, color: Colors.orange),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  MaterialButton(
                    color: Colors.black.withOpacity(0.5),
                    onPressed: () {
                      drinksService.nonAlcoholic();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const AlcoholicScreen(),
                            transitionDuration: const Duration(seconds: 1)),
                      );
                    },
                    child: const Text(
                      "Non Alcoholic",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  MaterialButton(
                    color: Colors.black.withOpacity(0.5),
                    onPressed: () async {
                      await drinksService.randomDrink().then((value) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const DetailDrinkScreen(),
                              transitionDuration: const Duration(seconds: 1)),
                        );
                      });
                    },
                    child: const Text(
                      "Try it!",
                      style: TextStyle(fontSize: 35, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
