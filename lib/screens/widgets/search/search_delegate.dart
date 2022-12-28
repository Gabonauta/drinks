import 'package:drinks/models/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Services/drinks_service.dart';

class DrinkSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("data");
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.local_drink,
        color: Colors.white54,
        size: 60,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final drinksService = Provider.of<DrinksProvider>(context, listen: false);
    drinksService.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: drinksService.suggestionsStream,
      builder: (BuildContext context, AsyncSnapshot<Detail> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        }

        final drinks = snapshot.data;

        return ListView.builder(
          itemCount: drinks!.drinks.length,
          itemBuilder: (_, index) {
            return _DrinkItem(
              detail: drinks.drinks[index],
            );
          },
        );
      },
    );
  }
}

class _DrinkItem extends StatelessWidget {
  final Map<String, String> detail;

  const _DrinkItem({required this.detail});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(detail["strDrink"]!),
      subtitle: Text(detail["strCategory"]!),
      leading: Image(
        image: NetworkImage(detail["strDrinkThumb"]!),
      ),
    );
  }
}
